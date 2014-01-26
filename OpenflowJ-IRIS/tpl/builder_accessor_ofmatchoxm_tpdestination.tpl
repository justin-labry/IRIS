		public Builder setTransportDestination(short destination) {
			byte network_protocol = this.getNetworkProtocol();
			switch ( network_protocol ) {
			case (byte) 6:
				return setValue(OFOxmMatchFields.OFB_TCP_DST, (byte) ${mask}, ByteBuffer.allocate(2).putShort(destination).array());
			case (byte) 17:
				return setValue(OFOxmMatchFields.OFB_UDP_DST, (byte) ${mask}, ByteBuffer.allocate(2).putShort(destination).array());
			case (byte) 132:
				return setValue(OFOxmMatchFields.OFB_SCTP_DST, (byte) ${mask}, ByteBuffer.allocate(2).putShort(destination).array());
			case (byte) 1:
				return setValue(OFOxmMatchFields.OFB_ICMPV4_CODE, (byte) ${mask}, new byte[] { (byte)destination });
			default:
				throw new IllegalStateException("Network protocol is wrongfully set to " + network_protocol);
			}
		}
		
		public short getTransportDestination() {
			byte network_protocol = this.getNetworkProtocol();
			org.openflow.protocol.interfaces.OFOxmMatchFields match_field = null;
			switch ( network_protocol ) {
			case (byte) 6:
				match_field = org.openflow.protocol.interfaces.OFOxmMatchFields.OFB_TCP_DST;
				break;
			case (byte) 17:
				match_field = org.openflow.protocol.interfaces.OFOxmMatchFields.OFB_UDP_DST;
				break;
			case (byte) 132:
				match_field = org.openflow.protocol.interfaces.OFOxmMatchFields.OFB_SCTP_DST;
				break;
			case (byte) 1:
				match_field = org.openflow.protocol.interfaces.OFOxmMatchFields.OFB_ICMPV4_CODE;
				break;
			default:
				throw new IllegalStateException("Network protocol is wrongfully set to " + network_protocol);
			}
			org.openflow.protocol.interfaces.OFOxm oxm = getValue(match_field);
			if ( oxm == null || oxm.getData() == null ) {
				return (short) 0;
			}
			return ByteBuffer.allocate(2).put(oxm.getData()).getShort();
		}
		
		public boolean isTransportDestinationSupported() {
			return true;
		}
		
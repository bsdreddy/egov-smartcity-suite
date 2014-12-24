/*
 * @(#)OutboundFile.java 3.0, 15 Jul, 2013 9:34:55 PM
 * Copyright 2013 eGovernments Foundation. All rights reserved. 
 * eGovernments PROPRIETARY/CONFIDENTIAL. Use is subject to license terms.
 */
package org.egov.dms.models;

import javax.validation.Valid;


/**
 * The Class OutboundFile.
 */
public class OutboundFile extends GenericFile {
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 1L;
	
	/** The receiver. */
	@Valid
	private ExternalUser receiver;
	
	/** The sender. */
	@Valid
	private InternalUser sender;
	
	/**
	 * Gets the receiver.
	 * @return the receiver
	 */
	public ExternalUser getReceiver() {
		return receiver;
	}
	
	/**
	 * Sets the receiver.
	 * @param receiver the receiver to set
	 */
	public void setReceiver(ExternalUser receiver) {
		this.receiver = receiver;
	}
	
	/**
	 * Gets the sender.
	 * @return the sender
	 */
	public InternalUser getSender() {
		return sender;
	}
	
	/**
	 * Sets the sender.
	 * @param sender the sender to set
	 */
	public void setSender(InternalUser sender) {
		this.sender = sender;
	}
}

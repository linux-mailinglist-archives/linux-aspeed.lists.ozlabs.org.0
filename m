Return-Path: <linux-aspeed+bounces-389-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB91A092E1
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Jan 2025 15:04:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV3Lb28MXz3c7H;
	Sat, 11 Jan 2025 01:04:39 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736517879;
	cv=none; b=npORJmAyfiWUl098IO4ZgnDNbRDMo5jC/Y00ptvhspsRaP4684EXKMlfeURGu+mx5fVAI9+e8RRxAtVyNyk/y/WZ732bH95LlwroGlRuYzaHl2KB0BD61C/xuaoGSva2YdS4/qbBzZwFnpgcHStOI+bFMB2oQ3RIJ9cwUwD4r+sIaVK6tftiefqiF0VNXuqSDwoxTya0o4g75Wzl9dIooJExSp4VZbRk4/eBnMEAu3qDeZNBJZvrLg+WrYvmIMbpYREHouGHjo+h2nT7oFF37xaFKQfMJdUIkEsW1xZtaROVpwX2AsW1Wbq2fDqQ3StRm61Z/rUzMgsz3v7hdfFacQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736517879; c=relaxed/relaxed;
	bh=7HjnwD9AZ9bpagwc/lNQ4PWx4QhMbmgXIuOqNi1NcM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwdtVfc0+fCNcI4QTHmwB8e7qZFEXsVWrNIAAVS2bn5PUh4/bSqmXm5GT8ZVVfDXq0W9oVxHSTVQz+0JcB/XYlJBWHAdc4hrOOIENwA47kUGE7LhnsOkMSSvTT5Y5lAQlEBqxeLQC7se6N9tnex1FEllevY9eEnSAupf6A3Tjx9ipXy27g0rqHKMAn+Ke4mPu+uyhx5oWQ3GYQ8UoUEdDZOzVdFqFqqE4tiE2VQrIdRqD2Fp0Kx9yyy01T21GK5AxtfMJ5kG7iyVjYkZlqGdCJzlvVIbHsz5me6Iqnbgp0HXqOKKDT7zARrK1JM65bIp58/xzOZC4c1eja/r/2EH1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=zMvidE4V; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=zMvidE4V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV3LY1MjCz3cWY
	for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Jan 2025 01:04:36 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7HjnwD9AZ9bpagwc/lNQ4PWx4QhMbmgXIuOqNi1NcM4=; b=zMvidE4VIvrovRs9QONvhitB+e
	kR5gnG6ymO+glm9en1J1Nlb08FgSGdcAS+0mGVXiKMTo+P9EkwKryA4kVyfERm1Ro9LhQYslrd09E
	sm6f5XyNdv5meaPSUYbpk7Qr0SMHYYNNELxgiDRGuNUJX1sksmTlMQI8AiClUojT3jeQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tWFcM-003FJ8-1r; Fri, 10 Jan 2025 15:04:06 +0100
Date: Fri, 10 Jan 2025 15:04:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Ninad Palsule <ninad@linux.ibm.com>,
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"eajames@linux.ibm.com" <eajames@linux.ibm.com>,
	"edumazet@google.com" <edumazet@google.com>,
	"joel@jms.id.au" <joel@jms.id.au>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"minyard@acm.org" <minyard@acm.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net" <openipmi-developer@lists.sourceforge.net>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	"ratbert@faraday-tech.com" <ratbert@faraday-tech.com>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: =?utf-8?B?5Zue6KaGOiDlm57opoY6IFtQQVRD?= =?utf-8?Q?H?= v2 05/10]
 ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <9fbc6f4c-7263-4783-8d41-ac2abe27ba95@lunn.ch>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
 <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
 <SEYPR06MB51344BA59830265A083469489D132@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <8042c67c-04d3-41c0-9e88-8ce99839f70b@lunn.ch>
 <c0b653ea-3fe0-4bdb-9681-bf4e3ef1364a@linux.ibm.com>
 <c05c0476-c8bd-42f4-81da-7fe96e8e503b@lunn.ch>
 <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Mailing-List: linux-aspeed@lists.ozlabs.org
List-Id: <linux-aspeed.lists.ozlabs.org>
List-Help: <mailto:linux-aspeed+help@lists.ozlabs.org>
List-Owner: <mailto:linux-aspeed+owner@lists.ozlabs.org>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linux-aspeed/>,
  <https://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Subscribe: <mailto:linux-aspeed+subscribe@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-digest@lists.ozlabs.org>,
  <mailto:linux-aspeed+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linux-aspeed+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB5134A63DBE28AA1305967A0C9D1C2@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> Agree. You are right. This part is used to create a gated clock.
> We will configure these RGMII delay in bootloader like U-boot.
> Therefore, here does not configure delay again.

> Because AST2600 MAC1/2 RGMII delay setting in scu region is combined to one 32-bit register, 
> MAC3/4 is also. I will also use 'aliase' to get MAC index to set delay in scu.
> 
> // aspeed-g6.dtsi
> aliases {
> 		..........
> 		mac0 = &mac0;
> 		mac1 = &mac1;
> 		mac2 = &mac2;
> 		mac4 = &mac3;
> 	};

I would avoid that, because they are under control of the DT
developer. You sometimes seen the order changed in the hope of
changing the interface names, rather than use a udev script, or
systemd naming scheme.

The physical address of each interface is well known and fixed? Are
they the same for all ASTxxxx devices? I would hard code them into the
driver to identify the instance.

But first we need to fix what is broken with the existing DT phy-modes
etc.

What is the reset default of these SCU registers? 0? So we can tell if
the bootloader has modified it and inserted a delay?

What i think you need to do is during probe of the MAC driver, compare
phy-mode and how the delays are configured in hardware. If the delays
in hardware are 0, assume phy-mode is correct and use it. If the
delays are not 0, compare them with phy-mode. If the delays and
phy-mode agree, use them. If they disagree, assume phy-mode is wrong,
issue a dev_warn() that the DT blob is out of date, and modify
phy-mode to match the delays in the hardware, including a good
explanation of what is going on in the commit message to help those
with out of tree DT files. And then patch all the in tree DT files to
use the correct phy-mode.

Please double check my logic, just to make sure it is correct. If i
have it correct, it should be backwards compatible. The one feature
you loose out on is when the bootloader sets the wrong delays and you
want phy-mode to actually override it.

When AST2700 comes along, you can skip all this, get it right from the
start and not need this workaround.

	Andrew


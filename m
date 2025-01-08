Return-Path: <linux-aspeed+bounces-376-lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ECB9A06949
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Jan 2025 00:08:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YT3WG6Kpxz30Qy;
	Thu,  9 Jan 2025 10:08:42 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736377722;
	cv=none; b=DxqcuGe/rtJDf/7tQnQKT86wMazQIoqV4WSLWAvHoYG7xEOR5jQDrp9g4RVJbSUvbSWdsjZTOmnplaUXqWq7CgYDdaZo7PkTkmeboYUNGAJBEyEdzwfunRwz/B2+i8gG0QeFRjrJJjP4loKJnUJA1LBD5zsbOeKO02qzgb5FvTrPMegrbYGy4sfT3jV7rmsHmDlVwrpQW0jzLCBHLw7+IxK/qQbJXoVpDIM8zHt248HmDvF/WTJYSaRj5IHJQTh0ZsiHI9d5veySjOSUzbEmHY9K9whbRrDHnMk/jvROr3feXu8cCZjgMyMFDwfkaQzk7XIsDgVbdkT5Mt4qUU2+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736377722; c=relaxed/relaxed;
	bh=QOtK78nI5rgA0uceIpeywrkch6lrzYwEKPd0Sio4ZFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfumdXsyQTRn+ryeau9YzMHKr54G07uV9NUscXfN3/0Y8jzECf8HRHo60QVe2+PnhNlQDu5Cxk7iewGVLvanu4CHIFadYWfm0GL+J+AhusUtPsFNDjbXMxnDW4a9Kk9hc2cgK7mxRigJN2ByVTrWepFdCsEtBOU9SO2/E5gxJ9H9aUZwxVrEE3KQrXS+P8b7ok6A4HtpnZIck3Z+kk65tmnuSlNkob60Yli9n6U4K/rnRQY6+Rogbzyn5OwpRrATemiGRcrAIT8X8kAoEO1z2fC03Feeq1yDb8QtDoCjnCyBXZlVT9EqR/YaCF2Z2wlGmuH6IIgkCQZ2ew1WcWMR+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DRFgas6V; dkim-atps=neutral; spf=pass (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org) smtp.mailfrom=lunn.ch
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=DRFgas6V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lunn.ch (client-ip=156.67.10.101; helo=vps0.lunn.ch; envelope-from=andrew@lunn.ch; receiver=lists.ozlabs.org)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YT3WD1FNMz2yZ4
	for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Jan 2025 10:08:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=QOtK78nI5rgA0uceIpeywrkch6lrzYwEKPd0Sio4ZFM=; b=DRFgas6VTsmXXXEGrkB5OiPOvF
	n24ZB8sfIZX6LOwyK9VXZLMMtiqAnersB31MXoV7NMLPgq2vZNJ+TswKCUlCkXPhdnLhF6ZHpY2mp
	k2vWGt8YIjABDZl9Tw+M6ErieZZOm2BpuusTUIiCS3UvQTF2viEAcvlZYFTHJjNl3fDg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVf9p-002iOJ-BJ; Thu, 09 Jan 2025 00:08:13 +0100
Date: Thu, 9 Jan 2025 00:08:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: Jacky Chou <jacky_chou@aspeedtech.com>,
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
Subject: Re: [PATCH v2 05/10] ARM: dts: aspeed: system1: Add RGMII support
Message-ID: <59116067-0caa-4666-b8dc-9b3125a37e6f@lunn.ch>
References: <SEYPR06MB5134CC0EBA73420A4B394A009D122@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <0c42bbd8-c09d-407b-8400-d69a82f7b248@lunn.ch>
 <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
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
In-Reply-To: <b2aec97b-63bc-44ed-9f6b-5052896bf350@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> There are around 11 boards in Aspeed SOC with phy-mode set to "rgmii" (some
> of them are mac0&1 and others are mac2&3). "rgmii-rxid" is only mine.
> 
> No one in aspeed SOC using "rgmii-id".

O.K, so we have to be careful how we fix this. But the fact they are
all equally broken might help here.

> > Humm, interesting. Looking at ftgmac100.c, i don't see where you
> > configure the RGMII delays in the MAC?

This is going to be important. How are delays configured if they are
not in the MAC driver?

    Andrew


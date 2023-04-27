Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74AF6F0F5A
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Apr 2023 01:59:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q6t4T16tjz3f6K
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 Apr 2023 09:59:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aBeprQVz;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=jk@codeconstruct.com.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=aBeprQVz;
	dkim-atps=neutral
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q6t4J5kYcz3c7d
	for <linux-aspeed@lists.ozlabs.org>; Fri, 28 Apr 2023 09:58:56 +1000 (AEST)
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 891CF20009;
	Fri, 28 Apr 2023 07:58:51 +0800 (AWST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1682639934;
	bh=HTlmV6ZYUailRTclcFWB41eToJ0kSd2aafbUpDtmzXM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aBeprQVzla52BpBzP4NDOD/EXYT0gCz5f/mBvPv3jwVqFXYNrXdbADJhjxk5EI88t
	 V1vDNRV4whgTv6fq1xKG8dqir0OP6olRos15WbZ8DWGcCo4quuskgrO+wsvsA8W8eu
	 4xnjzTe62VTdrXiIHhshul5GVO3isB4u6BROzVyXRHVINsiXZ0QcBOJxpaP62MRu8x
	 Re9YOC4oL3z16L8kxZeCOA7fNbpMYqLIQEOOm1WPXpJcHYI0AvHoXkaYbqqlrIiCA8
	 h75nIYkiXElBXVHeva9tsbmmmdNWoRBBXoOMNJvKJYKC8bJdbKZY7tXxzJbduUI5Gr
	 NgiuDvQV/CDWg==
Message-ID: <25ee56f181b11baa9ef54f13b6ef37977ee48b68.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/3] i3c: ast2600: Add AST2600 platform-specific
 driver
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: "Zbigniew, Lukwinski" <zbigniew.lukwinski@linux.intel.com>, 
	linux-i3c@lists.infradead.org
Date: Fri, 28 Apr 2023 07:58:50 +0800
In-Reply-To: <671a4bc0-526e-5224-7cb9-f80ebab2c0ef@linux.intel.com>
References: <20230331091501.3800299-1-jk@codeconstruct.com.au>
	 <20230331091501.3800299-4-jk@codeconstruct.com.au>
	 <671a4bc0-526e-5224-7cb9-f80ebab2c0ef@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
X-BeenThere: linux-aspeed@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux ASPEED SoC development <linux-aspeed.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linux-aspeed/>
List-Post: <mailto:linux-aspeed@lists.ozlabs.org>
List-Help: <mailto:linux-aspeed-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linux-aspeed>,
 <mailto:linux-aspeed-request@lists.ozlabs.org?subject=subscribe>
Cc: Vitor Soares <ivitro@gmail.com>, devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-aspeed@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matt Johnston <matt@codeconstruct.com.au>, Jack Chen <zenghuchen@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi=C2=A0Lukwinski,

> > +	case 545:
> > +		reg =3D AST2600_I3CG_REG0_SDA_PULLUP_EN_2K |
> > +			AST2600_I3CG_REG0_SDA_PULLUP_EN_750;
>
> It does not work. To enable PullUp=3D545R you need to set both 28 and
> 29 bit (0x30000000) but 'AST2600_I3CG_REG0_SDA_PULLUP_EN_2K |
> AST2600_I3CG_REG0_SDA_PULLUP_EN_750' is in fact 0x20000000.

Ah, good catch - I'd missed that the 2K is 0b00.

> Maybe you could consider adding extra macro
> 'AST2600_I3CG_REG0_SDA_PULLUP_EN_545' =3D (0x3 << 28)?

Sounds good, I'll send a fix today.

Cheers,


Jeremy

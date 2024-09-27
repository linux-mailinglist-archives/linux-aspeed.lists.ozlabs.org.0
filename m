Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E310987E5D
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 08:28:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XFLBw2q7wz30Sx
	for <lists+linux-aspeed@lfdr.de>; Fri, 27 Sep 2024 16:28:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727418516;
	cv=none; b=DcfLvDYAk2DmzNPLh4ZDPAeIL4ny3jPXX6Zr5nDClcSiG2FVtU4Qe7rSwQCPoXXiI9bees9HGhONNZgj5V1cVsKRf0tk0CD1wH5XRKrw/M0dTxgc4WSbWLcHMiD87XdwBUnrkrlB/VSMx/9U8bx1hkxQlqn2PphB+90UxWRMQfyM1BIUaqcJ+p0G1XklRuc7kyQcc0Ow/gTn8rPs6rdWvkKA285mX7PcdiDlJfy6uSqU9wPTD2vbWTHr7VPctTpy1DpP1S9HvKggR+ExtTQ9WNvbTeimfEoTX2uAgNka4nyuhwAdIA7PyCefhJMe5U0TZBxav7X0h4W88og3srCgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727418516; c=relaxed/relaxed;
	bh=jNmakUXF9nFiw23nJHwLmNqrMrEr852fUIAk37NrrB8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Fi7kooVw36OlrigXGhyRUAaQNjOZZ3IC9xApp2m5FmTeuAg1M+G5bWhRFpqAicuqZx5mHFb0uV6APyqZsgogyAsftVTMFEUXAMHzO7OxdrygcOregoeoNB/Cklk77FBT9Xf6LIg+mb4KFJCN47XHok9BdF3U+ANIa95xckGlQFC+DP+cR19rQKz9As2K/44lhtiPYQsEe2ti+EPPzzvixaBI0tTLBpIPHMvfjgaxzvQKYgsNIjQ0v+ZaYygNjwD3/YB99hBeK94JINhu91+WZMauPCqNSk5/0Jj61DeIs1tKt9ot+Wc4T/g/O13UW8ant2wc0ZmYCtIgZlXmSl0SSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hvXoLJvB; dkim-atps=neutral; spf=pass (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org) smtp.mailfrom=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=hvXoLJvB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XFLBr2Dy3z304s
	for <linux-aspeed@lists.ozlabs.org>; Fri, 27 Sep 2024 16:28:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727418515;
	bh=jNmakUXF9nFiw23nJHwLmNqrMrEr852fUIAk37NrrB8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=hvXoLJvBl0haqgB9gLlA5P7D0kpS7Lxe1BqXBsMzkz8L6h4g3DrxdzyEJ2/5jd3kh
	 5MoA2DXjwFlmM0E1NpmelUA6lD44TU3cKLK7B5qPfxYCy7XXnpEOzl1oRv8/IjFFXm
	 Le2Lnmqle6RCJ+QHaPqGke71+CTmlm1tqM6HT6RSWXstx0ONEDS7z7RjXn1Tcm2o8M
	 JsluSpJpYopW15KGXLH96pH3DhigLtu8Txil+jbIl13uPyb4o+1BzLL7AWqFc//Hy1
	 sXjFNkcmD4TrAvChxTRDs3exFvwzGQZeEnXedkxeXyk+62edYoD0uewbxubLUo0G1A
	 t+ZEmPk5eqCKA==
Received: from [192.168.68.112] (ppp118-210-187-73.adl-adc-lon-bras34.tpg.internode.on.net [118.210.187.73])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id F397365029;
	Fri, 27 Sep 2024 14:28:34 +0800 (AWST)
Message-ID: <7fd8cffb3212de8ae6acd7ab434a22cdd94d7279.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: correct the compatible
 string of adm1272
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>, 
	"patrick@stwcx.xyz"
	 <patrick@stwcx.xyz>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Date: Fri, 27 Sep 2024 15:58:34 +0930
In-Reply-To: <TYZPR04MB5853E2B3197AAD9268A0BAB2D66B2@TYZPR04MB5853.apcprd04.prod.outlook.com>
References: <20240926013411.3701546-1-Delphine_CC_Chiu@wiwynn.com>
	 <c2ddf0375eff2c9c18fd26029fc6a1be7ed23a8b.camel@codeconstruct.com.au>
	 <TYZPR04MB5853E2B3197AAD9268A0BAB2D66B2@TYZPR04MB5853.apcprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 2024-09-27 at 06:21 +0000, Delphine_CC_Chiu/WYHQ/Wiwynn wrote:
>=20
> > -----Original Message-----
> > From: Andrew Jeffery <andrew@codeconstruct.com.au>
> > Sent: Friday, September 27, 2024 2:01 PM
> > To: Delphine_CC_Chiu/WYHQ/Wiwynn <Delphine_CC_Chiu@wiwynn.com>;
> > patrick@stwcx.xyz; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Joel Stanley
> > <joel@jms.id.au>
> > Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-aspeed@lists.ozlabs.org; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v1] ARM: dts: aspeed: yosemite4: correct the compat=
ible
> > string of adm1272
> >=20
> >  [External Sender]
> >=20
> >  [External Sender]
> >=20
> > On Thu, 2024-09-26 at 09:34 +0800, Delphine CC Chiu wrote:
> > > From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > >=20
> > > Remove the redundant space in the compatible string of adm1272.
> >=20
> > In this case the space is not redundant, it's just incorrect, the compa=
tible string
> > doesn't match any specified. Do you mind fixing the wording?
> >=20
> Sure, I'll fixing the wording in v2.

Thanks.

>=20
> > >=20
> > > Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
> > > Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
> >=20
> > Can you please add an appropriate Fixes: tag?
> >=20
> > Thanks,
> >=20
> > Andrew
> >=20
> Would like to ask where should I add the Fixes: tag?
> Should I add in the patch title like:
> Fixes: ARM: dts: aspeed: yosemite4: correct the compatible string of adm1=
272
>=20
> Or should I add in the commit message?

It goes in the trailer block above your Signed-off-by tag. It will be
worth your time to review the following documentation:

- https://docs.kernel.org/process/5.Posting.html#patch-formatting-and-chang=
elogs
- https://docs.kernel.org/process/submitting-patches.html#describe-your-cha=
nges

The expected format and other details are described there.

Thanks,

Andrew


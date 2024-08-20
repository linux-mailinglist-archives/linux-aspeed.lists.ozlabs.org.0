Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7B957C92
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 07:01:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wny3h3vdzz2y8n
	for <lists+linux-aspeed@lfdr.de>; Tue, 20 Aug 2024 15:01:20 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=203.29.241.158
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=c9El3ODK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wny3d4J4kz2xPc
	for <linux-aspeed@lists.ozlabs.org>; Tue, 20 Aug 2024 15:01:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724130073;
	bh=2PRTSiGh3uU5dFAtSZg315/iLYxDuImsd1EksememsM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=c9El3ODKyA45Aur4k1l2dalKgBeCtGjSxD2WV53DdZ0MH51RBcNB9FwoxC2VSwTOB
	 EdS2Kc2HDdYEiFyBJRl6YgldpvunVXwR1B1RQD6h5u6SZZqpy90FAHeSH0vNpWyyf2
	 VM8OvxPoA6pWxggSdSmy5jqNwJjCVlQWWGdRn1RpHmc3RlznGtR3RBXQe3v902s8lC
	 NT2vP0ZH16HO5AezX5+XG6obKaA1tL4WH692/HB+mjwhghL8UO2L8Hqnu+uespzm2F
	 Ns8wNSUqmMTKiDVFAUPImY/tl6/3/n/8xiLwVdOjuzeoOUUSCL0z37Fwt3DBbtRmmX
	 IFglDWohAKyFA==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 27BAF64B84;
	Tue, 20 Aug 2024 13:01:10 +0800 (AWST)
Message-ID: <94efc2d4ff280a112b869124fc9d7e35ac031596.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for AST2700
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>
Date: Tue, 20 Aug 2024 14:31:07 +0930
In-Reply-To: <OS8PR06MB754148E915F6E6014F490583F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
References: <20240808075937.2756733-1-ryan_chen@aspeedtech.com>
	 <20240808075937.2756733-2-ryan_chen@aspeedtech.com>
	 <2f27285e-6aa5-4e42-b361-224d8d164113@kernel.org>
	 <OS8PR06MB75416FAD2A1A16E7BE2D255DF2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <10809e91-31be-4110-86c1-1e1ccb05b664@kernel.org>
	 <OS8PR06MB7541F4F740FDB17F50EBCACBF2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <20240813191454.GA1570645-robh@kernel.org>
	 <OS8PR06MB7541BB03AEE90B090AB990B3F2872@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <7e1dc98e0f69a095a8f7725b742df3c8d8436a67.camel@codeconstruct.com.au>
	 <OS8PR06MB754121818B9431941C18E09DF2802@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <OS8PR06MB7541C54CA074410C50BA419AF28C2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <64d13efd3119429ed876ad7ea499cff62e100fb9.camel@codeconstruct.com.au>
	 <OS8PR06MB754148E915F6E6014F490583F28D2@OS8PR06MB7541.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 2024-08-20 at 01:52 +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for
> > AST2700
> >=20
> > On Mon, 2024-08-19 at 03:05 +0000, Ryan Chen wrote:
> > > > > Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support
> > > > > for
> > > > > AST2700
> > > > >=20
> > > > > On Wed, 2024-08-14 at 06:35 +0000, Ryan Chen wrote:
> > > > > > >=20
> > > > > > > Didn't I see in another patch one die is cpu and one is
> > > > > > > io?
> > > > > > > Use
> > > > > > > those in the compatible rather than 0 and 1 if so.
> > > > > > >=20
> > > > > > Sorry, I want to align with our datasheet description.
> > > > > > It will but scu0 and scu1 register setting.
> > > > >=20
> > > > > Can we document that relationship in the binding? Rob's
> > > > > suggestion
> > > > > seems more descriptive.
> > > > Hello,
> > > > 	Do you want me document it in yaml file or just in
> > > > commit
> > > > message?
> > >=20
> > > Hello Rob, Andrew,
> > > 	I will add in yaml file in description. Like following.
> > >=20
> > > description:
> > > =C2=A0=C2=A0The Aspeed System Control Unit manages the global behavio=
ur of
> > > the
> > > SoC,
> > > =C2=A0=C2=A0configuring elements such as clocks, pinmux, and reset.
> > > +  In AST2700, it has two soc combination. Each soc include its
> > > own
> > > scu register control.
> > > +  ast2700-scu0 for soc0, ast2700-scu1 for soc1.
> > >=20
> > > Is that will be better way ?
> >=20
> > What Rob is suggesting is to add the compatibles "aspeed,ast2700-
> > scu-
> > cpu" and "aspeed,ast2700-scu-io", and then in the description say
> > something like:
> >=20
> > =C2=A0=C2=A0=C2=A0The AST2700 integrates both a CPU and an IO die, each=
 with their
> > own
> > =C2=A0=C2=A0=C2=A0SCU. The "aspeed,ast2700-scu-cpu" and "aspeed,ast2700=
-scu-io"
> > =C2=A0=C2=A0=C2=A0compatibles correspond to SCU0 and SCU1 respectively.
> >=20
> Hello Andrew,
> 	Sorry, for correspond for ast2700 datasheet, the description
> is scu0/scu1.
> 	System Control Unit #0 (SCU0)/ System Control Unit #1 (SCU1)
> why not we
> 	Keep align with datasheet statement?

Well, IMO we have an opportunity do better in the compatibles. I expect
we should take advantage of it. As some support for Rob's suggestion,
the datasheet chapter for SCU1 calls it "SCUIO" in the first sentence
of the description. Further, there are only two SCUs, and I don't think
the mapping of "cpu" to 0 and "io" to 1 is too difficult to keep track
of, certainly not if it's written in the binding documentation (as long
as these names are accurate!). The argument works both ways but I don't
think it's contentious that using the indexes is _less_ descriptive.

That said, this is just my semi-informed opinion. It's up to you to
decide what names you're going to push for. Rob's suggestion seems
reasonable to me though.

Andrew

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9199527BC
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2024 03:56:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CUPXQ1DY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkpCF4jpLz2yZ5
	for <lists+linux-aspeed@lfdr.de>; Thu, 15 Aug 2024 11:56:57 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=CUPXQ1DY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=codeconstruct.com.au (client-ip=203.29.241.158; helo=codeconstruct.com.au; envelope-from=andrew@codeconstruct.com.au; receiver=lists.ozlabs.org)
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkpC91zDLz2xl5
	for <linux-aspeed@lists.ozlabs.org>; Thu, 15 Aug 2024 11:56:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1723687010;
	bh=qUBxOvHAWeFArtr5V1bUsgelSpNmH8WO4eePZ7NEdgg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CUPXQ1DY7i14T913/rFWMRr8ldtWkqlgAKTCiENCACysKOnQui5Lv7/mRAnlCyvyd
	 TNywBWXGfI75ssY41bExvkJ1uGlCWKGA5QGeauuEs5eo9lTovUz1RVUoVilZiQltsx
	 pqk/Quk57zxRD9SIvkhgWEXAVfh9Ji0aIi4riBqKHdZTPs49JspMZOYzjOM64mcBnl
	 UJYpl8BUN180M9cqgSQsc9eKvsJZfZUSxFJZAyyoL8om22BuzCmTSalDoRklM9HIbB
	 B5zolpK6dfPec8a5Oa19rwgs/aU+LyO9yHduy/42ZejKX61Apm6whxgbYc8BplJtv2
	 YR721Y3BfJ1Pg==
Received: from [192.168.68.112] (ppp118-210-65-51.adl-adc-lon-bras32.tpg.internode.on.net [118.210.65.51])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 43EFE64C85;
	Thu, 15 Aug 2024 09:56:49 +0800 (AWST)
Message-ID: <d5c3e9583ee775fd06dfcc10741e89db17273efe.camel@codeconstruct.com.au>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for AST2700
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ryan Chen <ryan_chen@aspeedtech.com>, Rob Herring <robh@kernel.org>
Date: Thu, 15 Aug 2024 11:26:48 +0930
In-Reply-To: <OS8PR06MB754121818B9431941C18E09DF2802@OS8PR06MB7541.apcprd06.prod.outlook.com>
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

On Thu, 2024-08-15 at 01:43 +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for
> > AST2700
> >=20
> > On Wed, 2024-08-14 at 06:35 +0000, Ryan Chen wrote:
> > > > Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for
> > > > AST2700
> > > >=20
> > > > On Fri, Aug 09, 2024 at 06:10:22AM +0000, Ryan Chen wrote:
> > > > > > Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support
> > > > > > for
> > > > > > AST2700
> > > > > >=20
> > > > > > On 09/08/2024 07:55, Ryan Chen wrote:
> > > > > > > > Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed:
> > > > > > > > support
> > > > > > > > for
> > > > > > > > AST2700
> > > > > > > >=20
> > > > > > > > On 08/08/2024 09:59, Ryan Chen wrote:
> > > > > > > > > Add compatible support for AST2700 clk, reset,
> > > > > > > > > pinctrl,
> > > > > > > > > silicon-id and example for AST2700 scu.
> > > > > > > > >=20
> > > > > > > > > Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > > > > > > > > ---
> > > > > > > > > =C2=A0.../bindings/mfd/aspeed,ast2x00-scu.yaml      | 31
> > > > > > > > +++++++++++++++++--
> > > > > > > > > =C2=A01 file changed, 29 insertions(+), 2 deletions(-)
> > > > > > > > >=20
> > > > > > > > > diff --git
> > > > > > > > > a/Documentation/devicetree/bindings/mfd/aspeed,ast2x0
> > > > > > > > > 0-
> > > > > > > > > scu.yaml
> > > > > > > > > b/Documentation/devicetree/bindings/mfd/aspeed,ast2x0
> > > > > > > > > 0-
> > > > > > > > > scu.yaml
> > > > > > > > > index 86ee69c0f45b..c0965f08ae8c 100644
> > > > > > > > > ---
> > > > > > > > > a/Documentation/devicetree/bindings/mfd/aspeed,ast2x0
> > > > > > > > > 0-
> > > > > > > > > scu.yaml
> > > > > > > > > +++
> > > > > > > > > b/Documentation/devicetree/bindings/mfd/aspeed,ast2x0
> > > > > > > > > 0-
> > > > > > > > > scu.y
> > > > > > > > > +++ aml
> > > > > > > > > @@ -21,6 +21,8 @@ properties:
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0- aspeed,ast2400-scu
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0- aspeed,ast2500-scu
> > > > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0- aspeed,ast2600-scu
> > > > > > > > > +          - aspeed,ast2700-scu0
> > > > > > > > > +          - aspeed,ast2700-scu1
> > > > > > > >=20
> > > > > > > > What are the differences between these two?
> > > > > > >=20
> > > > > > > The next [PATCH 4/4] is scu driver that include ast2700-
> > > > > > > scu0
> > > > > > > and
> > > > > > > ast2700-scu1 CLK_OF_DECLARE_DRIVER(ast2700_soc0,
> > > > > > > "aspeed,ast2700-scu0", ast2700_soc0_clk_init);
> > > > > > > CLK_OF_DECLARE_DRIVER(ast2700_soc1, "aspeed,ast2700-
> > > > > > > scu1",
> > > > > > > ast2700_soc1_clk_init);
> > > > > >=20
> > > > > > What are hardware differences? Entirely different devices?
> > > > >=20
> > > > > AST2700 have two soc die connected each other.
> > > > > Each soc die have it own scu, so the naming is ast2700-scu0
> > > > > for
> > > > > soc0,
> > > > another is ast2700-scu1 for soc1.
> > > >=20
> > > > Didn't I see in another patch one die is cpu and one is io? Use
> > > > those in the compatible rather than 0 and 1 if so.
> > > >=20
> > > Sorry, I want to align with our datasheet description.
> > > It will but scu0 and scu1 register setting.
> >=20
> > Can we document that relationship in the binding? Rob's suggestion
> > seems
> > more descriptive.
> Hello,
> 	Do you want me document it in yaml file or just in commit
> message?

In the binding document please!

Andrew


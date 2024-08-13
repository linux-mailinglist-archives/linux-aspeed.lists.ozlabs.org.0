Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C66950CF9
	for <lists+linux-aspeed@lfdr.de>; Tue, 13 Aug 2024 21:15:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dnk0fI1S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk1Kz57TQz2yR1
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2024 05:15:03 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dnk0fI1S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk1Kt6JL5z2xBb
	for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2024 05:14:58 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32C7ECE0159;
	Tue, 13 Aug 2024 19:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F82C32782;
	Tue, 13 Aug 2024 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723576496;
	bh=TFZ49Ns7Kf0xRnS/LrkyPrwzUsMYbfghsSEb2PzGBT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dnk0fI1St0ZpMvptwuW4HlnIFE7UJY3sYdJ8s62UjJSMRmtKJAxfl5NIqVZrnaWet
	 7c1ymTPG0F3kg8uKcEc9f1yrHxEHbHoLhHthsb26qCyoYDYSyRQCunU66s+VZrNjwX
	 I+r2a3R4sFGqpA38mMRnJlp4djS/u60zR8IWFZhxZUsKd1S1+148k//9h719/1xQIU
	 6LbBEVcHgcbyPe2WqL0asT3pgwRSiYg4rq2Uhc+fLlteKtID6Gk5003d4ci57adHkI
	 ZZw8LWoVvPo/BiXpphFan8ZaVdLdZxl+Mfhp5E8Ryle9071cAnKGdL2Eby5ZWYc+ko
	 k3GLg+vTNq1zA==
Date: Tue, 13 Aug 2024 13:14:54 -0600
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for AST2700
Message-ID: <20240813191454.GA1570645-robh@kernel.org>
References: <20240808075937.2756733-1-ryan_chen@aspeedtech.com>
 <20240808075937.2756733-2-ryan_chen@aspeedtech.com>
 <2f27285e-6aa5-4e42-b361-224d8d164113@kernel.org>
 <OS8PR06MB75416FAD2A1A16E7BE2D255DF2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
 <10809e91-31be-4110-86c1-1e1ccb05b664@kernel.org>
 <OS8PR06MB7541F4F740FDB17F50EBCACBF2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OS8PR06MB7541F4F740FDB17F50EBCACBF2BA2@OS8PR06MB7541.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Lee Jones <lee@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Aug 09, 2024 at 06:10:22AM +0000, Ryan Chen wrote:
> > Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for AST2700
> >
> > On 09/08/2024 07:55, Ryan Chen wrote:
> > >> Subject: Re: [PATCH 1/4] dt-bindings: mfd: aspeed: support for
> > >> AST2700
> > >>
> > >> On 08/08/2024 09:59, Ryan Chen wrote:
> > >>> Add compatible support for AST2700 clk, reset, pinctrl, silicon-id
> > >>> and example for AST2700 scu.
> > >>>
> > >>> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> > >>> ---
> > >>>  .../bindings/mfd/aspeed,ast2x00-scu.yaml      | 31
> > >> +++++++++++++++++--
> > >>>  1 file changed, 29 insertions(+), 2 deletions(-)
> > >>>
> > >>> diff --git
> > >>> a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > >>> b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > >>> index 86ee69c0f45b..c0965f08ae8c 100644
> > >>> --- a/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > >>> +++ b/Documentation/devicetree/bindings/mfd/aspeed,ast2x00-scu.yaml
> > >>> @@ -21,6 +21,8 @@ properties:
> > >>>            - aspeed,ast2400-scu
> > >>>            - aspeed,ast2500-scu
> > >>>            - aspeed,ast2600-scu
> > >>> +          - aspeed,ast2700-scu0
> > >>> +          - aspeed,ast2700-scu1
> > >>
> > >> What are the differences between these two?
> > >
> > > The next [PATCH 4/4] is scu driver that include ast2700-scu0 and
> > > ast2700-scu1 CLK_OF_DECLARE_DRIVER(ast2700_soc0,
> > > "aspeed,ast2700-scu0", ast2700_soc0_clk_init);
> > > CLK_OF_DECLARE_DRIVER(ast2700_soc1, "aspeed,ast2700-scu1",
> > > ast2700_soc1_clk_init);
> >
> > What are hardware differences? Entirely different devices?
> 
> AST2700 have two soc die connected each other.
> Each soc die have it own scu, so the naming is ast2700-scu0 for soc0, another is ast2700-scu1 for soc1.

Didn't I see in another patch one die is cpu and one is io? Use those in 
the compatible rather than 0 and 1 if so.

Rob


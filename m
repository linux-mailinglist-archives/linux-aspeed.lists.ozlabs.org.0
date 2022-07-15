Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31493575DEF
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jul 2022 10:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lklbs3wsgz3c6n
	for <lists+linux-aspeed@lfdr.de>; Fri, 15 Jul 2022 18:57:13 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=216.24.177.18; helo=fornost.hmeau.com; envelope-from=herbert@gondor.apana.org.au; receiver=<UNKNOWN>)
X-Greylist: delayed 2098 seconds by postgrey-1.36 at boromir; Fri, 15 Jul 2022 18:57:07 AEST
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lklbl3hwVz3c1Q
	for <linux-aspeed@lists.ozlabs.org>; Fri, 15 Jul 2022 18:57:07 +1000 (AEST)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
	by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1oCGZm-000nQg-Ab; Fri, 15 Jul 2022 18:21:31 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 15 Jul 2022 16:21:30 +0800
Date: Fri, 15 Jul 2022 16:21:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Neal Liu <neal_liu@aspeedtech.com>
Subject: Re: [PATCH v7 0/5] Add Aspeed crypto driver for hardware acceleration
Message-ID: <YtEjivBuw5MMpXJi@gondor.apana.org.au>
References: <20220705020936.1751771-1-neal_liu@aspeedtech.com>
 <HK0PR06MB3202AE39EF5F43E62F19337880879@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3202AE39EF5F43E62F19337880879@HK0PR06MB3202.apcprd06.prod.outlook.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Johnny Huang <johnny_huang@aspeedtech.com>, "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, Randy Dunlap <rdunlap@infradead.org>, Dhananjay Phadke <dhphadke@microsoft.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Corentin Labbe <clabbe.montjoie@gmail.com>, "David S . Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 11, 2022 at 03:23:00AM +0000, Neal Liu wrote:
> > -----Original Message-----
> > From: Neal Liu <neal_liu@aspeedtech.com>
> > Sent: Tuesday, July 5, 2022 10:10 AM
> > To: Corentin Labbe <clabbe.montjoie@gmail.com>; Christophe JAILLET
> > <christophe.jaillet@wanadoo.fr>; Randy Dunlap <rdunlap@infradead.org>;
> > Herbert Xu <herbert@gondor.apana.org.au>; David S . Miller
> > <davem@davemloft.net>; Rob Herring <robh+dt@kernel.org>; Krzysztof
> > Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Joel Stanley <joel@jms.id.au>;
> > Andrew Jeffery <andrew@aj.id.au>; Dhananjay Phadke
> > <dhphadke@microsoft.com>; Johnny Huang
> > <johnny_huang@aspeedtech.com>
> > Cc: linux-aspeed@lists.ozlabs.org; linux-crypto@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org; BMC-SW <BMC-SW@aspeedtech.com>
> > Subject: [PATCH v7 0/5] Add Aspeed crypto driver for hardware acceleration
> 
> Gentle ping on these patch series, thanks.

Please address the comments that you've received first.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

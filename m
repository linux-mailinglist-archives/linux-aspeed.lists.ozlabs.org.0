Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFD2788601
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 13:39:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXHzr2b0dz3dKB
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Aug 2023 21:39:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gondor.apana.org.au (client-ip=167.179.156.38; helo=167-179-156-38.a7b39c.syd.nbn.aussiebb.net; envelope-from=herbert@gondor.apana.org.au; receiver=lists.ozlabs.org)
Received: from 167-179-156-38.a7b39c.syd.nbn.aussiebb.net (167-179-156-38.a7b39c.syd.nbn.aussiebb.net [167.179.156.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVsX96940z2ydW
	for <linux-aspeed@lists.ozlabs.org>; Wed, 23 Aug 2023 13:44:09 +1000 (AEST)
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
	id 1qYe6H-006o9O-CL; Wed, 23 Aug 2023 11:00:06 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Wed, 23 Aug 2023 11:00:06 +0800
Date: Wed, 23 Aug 2023 11:00:06 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] crypto: Explicitly include correct DT includes
Message-ID: <ZOV2Nn4o8Ldy9P1i@gondor.apana.org.au>
References: <20230714174421.4054194-1-robh@kernel.org>
 <CAL_JsqL_CvroupJEFwrjt8WOq=4WBxvE3sOTMnY8hEuBAMG=1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_JsqL_CvroupJEFwrjt8WOq=4WBxvE3sOTMnY8hEuBAMG=1g@mail.gmail.com>
X-Mailman-Approved-At: Fri, 25 Aug 2023 21:33:58 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, linux-aspeed@lists.ozlabs.org, Gaurav Jain <gaurav.jain@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Corentin Labbe <clabbe.montjoie@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, William Qiu <william.qiu@starfivetech.com>, linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, Jia Jie Ho <jiajie.ho@starfivetech.com>, Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>, Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@linaro.org>, linux-sunxi@lists.linux.dev, Declan Murphy <declan.murphy@intel.com>, devicetree@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, Vladimir Zapolskiy <vz@mleia.com>, Gilad Ben-Yossef <g
 ilad@benyossef.com>, linux-amlogic@lists.infradead.org, Michal Simek <michal.simek@amd.com>, Daniele Alessandrelli <daniele.alessandrelli@intel.com>, linux-arm-kernel@lists.infradead.org, Neal Liu <neal_liu@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Harsha <harsha.harsha@amd.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-crypto@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Aug 22, 2023 at 05:40:57PM -0500, Rob Herring wrote:
> On Fri, Jul 14, 2023 at 12:44 PM Rob Herring <robh@kernel.org> wrote:
> >
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those include
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> >  drivers/crypto/allwinner/sun4i-ss/sun4i-ss-core.c   | 1 -
> >  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c   | 1 -
> >  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c   | 1 -
> >  drivers/crypto/amlogic/amlogic-gxl-core.c           | 1 -
> >  drivers/crypto/aspeed/aspeed-acry.c                 | 3 ---
> >  drivers/crypto/atmel-aes.c                          | 6 ++----
> >  drivers/crypto/atmel-ecc.c                          | 2 +-
> >  drivers/crypto/atmel-sha.c                          | 6 ++----
> >  drivers/crypto/atmel-tdes.c                         | 6 ++----
> >  drivers/crypto/bcm/cipher.c                         | 3 +--
> >  drivers/crypto/caam/ctrl.c                          | 1 +
> >  drivers/crypto/caam/jr.c                            | 1 +
> >  drivers/crypto/caam/qi.c                            | 1 +
> >  drivers/crypto/ccree/cc_driver.c                    | 1 -
> >  drivers/crypto/exynos-rng.c                         | 2 +-
> >  drivers/crypto/gemini/sl3516-ce-core.c              | 1 -
> >  drivers/crypto/img-hash.c                           | 4 ++--
> >  drivers/crypto/intel/keembay/keembay-ocs-hcu-core.c | 3 ++-
> >  drivers/crypto/n2_core.c                            | 2 +-
> >  drivers/crypto/omap-aes.c                           | 1 -
> >  drivers/crypto/omap-des.c                           | 2 --
> >  drivers/crypto/omap-sham.c                          | 1 -
> >  drivers/crypto/rockchip/rk3288_crypto.c             | 1 -
> >  drivers/crypto/s5p-sss.c                            | 1 -
> >  drivers/crypto/sa2ul.c                              | 3 ++-
> >  drivers/crypto/sahara.c                             | 1 -
> >  drivers/crypto/starfive/jh7110-cryp.c               | 2 +-
> >  drivers/crypto/starfive/jh7110-hash.c               | 1 -
> >  drivers/crypto/stm32/stm32-cryp.c                   | 2 +-
> >  drivers/crypto/stm32/stm32-hash.c                   | 2 +-
> >  drivers/crypto/talitos.c                            | 4 ++--
> >  drivers/crypto/xilinx/zynqmp-aes-gcm.c              | 2 +-
> >  drivers/crypto/xilinx/zynqmp-sha.c                  | 1 -
> >  33 files changed, 25 insertions(+), 45 deletions(-)
> 
> Ping!

Sorry, I misfiled this one.  I'll get onto it now.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

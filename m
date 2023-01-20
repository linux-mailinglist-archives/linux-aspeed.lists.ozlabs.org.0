Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905767747D
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 04:32:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P0bJB6sZ4z301F
	for <lists+linux-aspeed@lfdr.de>; Mon, 23 Jan 2023 14:32:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rMYgPKw1;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=rMYgPKw1;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NywGR6plsz3fH0;
	Fri, 20 Jan 2023 21:09:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4CF861EFE;
	Fri, 20 Jan 2023 10:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA804C433D2;
	Fri, 20 Jan 2023 10:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1674209387;
	bh=QQh8ShqbKc4vcCYjUJJI+sW3w3r+3sanu/vPZ2IyzTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rMYgPKw1pGl3FwPpK4PFmTlmFnpTnyZ7ux/Z8gB+BTQu8ad2dbnHGdmqSUUh9QAo3
	 C+u0IUTCPhPJwzafpGLLSfvLo60WsvNwXWf3AIb1nv8SUA+shDrhHnhPjsEK+wxt8Q
	 HF3ooQ8AjjaEe2zCmeFagpTzLf/Qp8lQOOmYtGYc=
Date: Fri, 20 Jan 2023 11:09:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH v2 06/13] staging: Replace all spi->chip_select and
 spi->cs_gpiod references with function call
Message-ID: <Y8poZ1wN8/dAO3H/@kroah.com>
References: <20230119185342.2093323-1-amit.kumar-mahapatra@amd.com>
 <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119185342.2093323-7-amit.kumar-mahapatra@amd.com>
X-Mailman-Approved-At: Mon, 23 Jan 2023 14:29:55 +1100
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
Cc: heiko@sntech.de, linus.walleij@linaro.org, dri-devel@lists.freedesktop.org, alim.akhtar@samsung.com, miquel.raynal@bootlin.com, sumit.semwal@linaro.org, stefan@datenfreihafen.org, tmaimon77@gmail.com, linux-samsung-soc@vger.kernel.org, samuel@sholland.org, khilman@baylibre.com, haibo.chen@nxp.com, mingo@redhat.com, linux-imx@nxp.com, linux-sunxi@lists.linux.dev, s.hauer@pengutronix.de, l.stelmach@samsung.com, sanju.mehta@amd.com, elder@kernel.org, sbranden@broadcom.com, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, yogeshgaur.83@gmail.com, michael@walle.cc, skomatineni@nvidia.com, kernel@pengutronix.de, olteanv@gmail.com, linux-wpan@vger.kernel.org, claudiu.beznea@microchip.com, alexandre.belloni@bootlin.com, linux-aspeed@lists.ozlabs.org, linux-wireless@vger.kernel.org, edumazet@google.com, thierry.reding@gmail.com, lars@metafoo.de, vireshk@kernel.org, jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, jbrunet@baylibre.
 com, linux-media@vger.kernel.org, andi@etezian.org, Michael.Hennerich@analog.com, martin.blumenstingl@googlemail.com, linux-arm-msm@vger.kernel.org, radu_nicolae.pirea@upb.ro, haojian.zhuang@gmail.com, jaswinder.singh@linaro.org, clg@kaod.org, linux-amlogic@lists.infradead.org, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, libertas-dev@lists.infradead.org, davem@davemloft.net, mcoquelin.stm32@gmail.com, jic23@kernel.org, linux-rpi-kernel@lists.infradead.org, narmstrong@baylibre.com, linux-iio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mtd@lists.infradead.org, masahisa.kojima@linaro.org, festevam@gmail.com, git@amd.com, f.fainelli@gmail.com, linux-staging@lists.linux.dev, jernej.skrabec@gmail.com, yuenn@google.com, wens@csie.org, bcm-kernel-feedback-list@broadcom.com, pabeni@redhat.com, amitrkcian2002@gmail.com, rjui@broadcom.com, john.garry@huawei.com, j.neuschaefer@gmx.net, rostedt@goodmis.org, broonie@kernel.org, tali.perry1@gma
 il.com, avifishman70@gmail.com, ldewangan@nvidia.com, netdev@vger.kernel.org, shawnguo@kernel.org, christian.koenig@amd.com, alex.aring@gmail.com, vigneshr@ti.com, konrad.dybcio@somainline.org, alexandre.torgue@foss.st.com, bjorn.andersson@linaro.org, linux-riscv@lists.infradead.org, robert.jarzmik@free.fr, kdasu.kdev@gmail.com, richard@nod.at, agross@kernel.org, kuba@kernel.org, tudor.ambarus@microchip.com, kvalo@kernel.org, johan@kernel.org, rmfrfs@gmail.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, han.xu@nxp.com, venture@google.com, nicolas.ferre@microchip.com, fancer.lancer@gmail.com, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, pratyush@kernel.org, openbmc@lists.ozlabs.org, daniel@zonque.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jan 20, 2023 at 12:23:35AM +0530, Amit Kumar Mahapatra wrote:
> Supporting multi-cs in spi drivers would require the chip_select & cs_gpiod
> members of struct spi_device to be an array. But changing the type of these
> members to array would break the spi driver functionality. To make the
> transition smoother introduced four new APIs to get/set the
> spi->chip_select & spi->cs_gpiod and replaced all spi->chip_select and
> spi->cs_gpiod references with get or set API calls.
> While adding multi-cs support in further patches the chip_select & cs_gpiod
> members of the spi_device structure would be converted to arrays & the
> "idx" parameter of the APIs would be used as array index i.e.,
> spi->chip_select[idx] & spi->cs_gpiod[idx] respectively.
> 
> Signed-off-by: Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 302726B72D7
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsCV0djVz3bjx
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=ubF2lj5l;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=2a01:4f8:c0c:9d57::1; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=ubF2lj5l;
	dkim-atps=neutral
X-Greylist: delayed 596 seconds by postgrey-1.36 at boromir; Thu, 09 Mar 2023 19:48:16 AEDT
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXNB814jcz3cBK;
	Thu,  9 Mar 2023 19:48:16 +1100 (AEDT)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 06553D5A;
	Thu,  9 Mar 2023 09:38:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678351086;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y41tMb7AS1Jh/KPkjkW3IKsx9az487kv51tekdAE29Q=;
	b=ubF2lj5lvtCp3H7KLxdAsbRS49b+6sBRLrUXT9KQPAgSrFQzeRzDS2fkDLPSfxRKxt25Py
	hhzH14kjrTJ0eUyJPpIVEPLzilgqwrH77iFF2rczY3X2G6Whjsyv75W5o2zLkv4xQr0gS3
	6/DwPS9d5+CcLnmWTtd0b2D4aR8vAOPXcJSIhsTen4XwVezu/C9iULPkPkJ8scOVW8Rqwi
	XgfaTBwuaDA9OgZLRgWwM3HjL8p90rrGeieoSN7ZzRIM0/TCOY48OR3QUrjt4XEXy+a5Nk
	4LKbiDSTBEEp1YIlprtkvdq1LtX0K44TNRpBr6xjevQvrOhW6/dMHqZlCotLiw==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 09:38:05 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 13 Mar 2023 20:42:54 +1100
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com, kdasu.kdev@gmail.com, richard@nod.at, Sergiu.Moga@microchip.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com, bcm-kernel-feedback-list@broadcom.com, yogeshgaur.83@gmail.com, linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, venture@google.com, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, avifishman70@gmail.com, mcoquelin.stm32@gmail.com, Claudiu.Beznea@microchip.com, Pratyush Yadav 
 <pratyush@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

> In an ideal world, where both the controller and the device talk about
> dummy number of cycles, I would agree with you, buswidth and dtr should
> not be relevant for the number of dummy cycles. But it seems that there
> are old controllers (e.g. spi-hisi-sfc-v3xx.c, spi-mt65xx.c, 
> spi-mxic.c)
> that support buswidths > 1 and work only with dummy nbytes, they are 
> not
> capable of specifying a smaller granularity (ncycles). Thus the older
> controllers would have to convert the dummy ncycles to dummy nbytes.
> Since mixed transfer modes are a thing (see jesd251, it talks about
> 4S-4D-4D), where single transfer mode (S) can be mixed with double
> transfer mode (D) for a command, the controller would have to guess the
> buswidth and dtr of the dummy. Shall they replicate the buswidth and 
> dtr
> of the address or of the data? There's no rule for that.

But in the end that doesn't matter because they are just dummy clock
cycles and the mode will only affect the data/address/command. 
Therefore,
the controller is free to choose the mode that suits it best.

But that begs the question, is ncycles in regard to DTR or SDR? That is,
are you counting just one type of edges or both the falling and rising
edges. The smallest granularity would be ncycles in regard of DTR. To 
me,
it's not obvious what the SEMPER Nano Flash [1] uses. I'd say we choose
the smallest granularty in spi-mem to be future proof and maybe provide
some spi-mem helper to help setting the cycles for SDR/DTR. As an 
example,
if you want to wait 4 cycles in SDR you'd have ncycles=8 in spi-mem.

So you won't need the mode nor the dtr property.

-michael

[1] 
https://www.infineon.com/dgdl/Infineon-S25FS256T_256Mb_SEMPER_Nano_Flash_Quad_SPI_1.8V-DataSheet-v01_00-EN.pdf?fileId=8ac78c8c80027ecd0180740c5a46707a

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D736B72EA
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsDP4Z87z3c7S
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=yw+qp48S;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=159.69.201.130; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=yw+qp48S;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXYM326k5z3bgv;
	Fri, 10 Mar 2023 02:41:35 +1100 (AEDT)
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 4B77970;
	Thu,  9 Mar 2023 16:41:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1678376491;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r60XWQKaLUS5jZxaKx7MYiskgFp+zOaGglaYs+jZpB4=;
	b=yw+qp48S48+4FOgaRHiANfTm+xvcoCzUGV9aYe37Jj3gd+iyXZkSHEY3ajTl1gOkq7oO5u
	znQsK6gjuSZJQmV9F723h6LSh+Ua5//e2bDncUPygUzT8hsi83CTGF4SyHwJFvXkV3bxwp
	CSxbPy6deUetvisKRLNhwMhMdvwvdcvcYWMFmvpQcTXWm1tYcUpnfbR5h0X1c4xBJ/n99t
	LlDhNRFLCLOUgkU31/Pfsu4T4OopSDPVFJL45qWT2crt5QCwG9zx+Pib9gs+m5W6j+K4DE
	k5NJkQtIMfNPp2V0U7zXvNaTeoF7LpJdtWjywMe7UMb6WsgT4EKOB7vyOtTqeA==
MIME-Version: 1.0
Date: Thu, 09 Mar 2023 16:41:31 +0100
From: Michael Walle <michael@walle.cc>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
In-Reply-To: <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation>
 <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation>
 <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc>
 <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc>
 <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc>
 <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc>
 <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
 <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <844d3d6807106a78767607327e2ec0d5@walle.cc>
X-Sender: michael@walle.cc
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: alexandre.belloni@bootlin.com, vigneshr@ti.com, linux-aspeed@lists.ozlabs.org, alexandre.torgue@foss.st.com, tali.perry1@gmail.com, linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, linux-spi@vger.kernel.org, michal.simek@xilinx.com, tmaimon77@gmail.com, kdasu.kdev@gmail.com, richard@nod.at, Sergiu.Moga@microchip.com, haibo.chen@nxp.com, openbmc@lists.ozlabs.org, yuenn@google.com, Tudor Ambarus <tudor.ambarus@linaro.org>, bcm-kernel-feedback-list@broadcom.com, yogeshgaur.83@gmail.com, linux-rockchip@lists.infradead.org, Tudor Ambarus <tudor.ambarus@microchip.com>, john.garry@huawei.com, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, clg@kaod.org, matthias.bgg@gmail.com, han.xu@nxp.com, linux-arm-kernel@lists.infradead.org, venture@google.com, linux-stm32@st-md-mailman.stormreply.com, heiko@sntech.de, Nicolas.Ferre@microchip.com, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, avifishman70@gmail.com, mcoquelin.stm32@gmail.com, Cla
 udiu.Beznea@microchip.com, Pratyush Yadav <pratyush@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Am 2023-03-09 15:19, schrieb Chuanhong Guo:
> Hi!
> 
> On Thu, Mar 9, 2023 at 10:04 PM Michael Walle <michael@walle.cc> wrote:
>> 
>> Am 2023-03-09 14:54, schrieb Tudor Ambarus:
>> > On 09.03.2023 15:33, Michael Walle wrote:
>> >>>>> The controllers that can talk in dummy ncycles don't need the
>> >>>>> dummy.{buswidth, dtr} fields.
>> >>>>>
>> >>>>> The controllers that can't talk in dummy cycles, but only on a
>> >>>>> "byte"
>> >>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
>> >>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does not
>> >>>>> have
>> >>>>> the buswidth and dtr info, it can't convert the dummy ncycles to
>> >>>>> nbytes.
>> >>>>> If he knows only that buswidth is 8, it will convert ncycles to 4
>> >>>>> bytes.
>> >>>>> If dtr is also specified it converts ncycles to 2 bytes.
>> >>>>
>> >>>> No they don't need it. Lets take your semper flash and assume it
>> >>>> needs
>> >>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of the
>> >>>> mode
>> >>>> or dtr setting*. The controller then knows we need 12 clock cycles.
>> >>>> It has
>> >>>> then to figure out how that can be achieved. E.g. if it can only do
>> >>>> the
>> >>>> "old" byte programming and is in quad mode, good for it. It will
>> >>>> send 6
>> >>>> dummy bytes, which will result in 12 dummy clock cycles, because 1
>> >>>> byte
>> >>>> takes two clock cycles in quad SDR mode. If its in octal mode, send
>> >>>> 12
>> >>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
>> >>>> single bit mode, because it cannot send 1.5 bytes..
>> >>>>
>> >>>
>> >>> You miss the fact that you can have 1-1-4. What buswidth do you use
>> >>> for dummy, the address buswidth or the data buswidth?
>> >>
>> >> Doesn't matter, does it? The driver is free to chose, 1, 4, or
>> >> anything
>> >> else. You don't sample any data during the dummy phase.
>> >> To answer your question: single for instruction, single for address,
>> >> whatever you choose for dummy as long as there are ncycles space
>> >> between
>> >> address and data, and quad for data.
>> >
>> > Huh? How does the controller chose, based on what?
>> 
>> Based on its own capabilities. It can choose either way. In the end
>> what matters is how many clock cycles there are between the address
>> and data phase. And you only need to convey that information to the
>> SPI controller - your new ncycles.
> 
> It does matter. Controller may be designed to actively drive
> MOSI/WP/HOLD during single-spi dummy cycles and WP/HOLD
> during dual-spi dummy cycles. If the pin modes between the
> controller and device mismatched, worst case scenario
> the chip may get fried.

Interesting. But most of the time you'll have to do what the
spi controller supports. Only if its freely programmable,
then according to your comment you'd choose the buswidth of
the data phase to be on the safe side.

Btw. this is not what spi-nor is doing right now.

-michael

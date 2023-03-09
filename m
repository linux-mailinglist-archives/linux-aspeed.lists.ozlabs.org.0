Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BE36B72E3
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 10:43:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZsDF0gLhz3cBF
	for <lists+linux-aspeed@lfdr.de>; Mon, 13 Mar 2023 20:43:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pQ8rH9hm;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com; envelope-from=gch981213@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pQ8rH9hm;
	dkim-atps=neutral
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXWY95nP3z3cJn;
	Fri, 10 Mar 2023 01:20:11 +1100 (AEDT)
Received: by mail-wr1-x42e.google.com with SMTP id e13so2015728wro.10;
        Thu, 09 Mar 2023 06:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678371608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
        b=pQ8rH9hmAvMGPdlWLtsaiCL1tbAk6J5Bet/1wrFc3yD0T50sPxhzJap0s2h/tEDON1
         ZyckrHIm+7bwS9K33CaoBmOEZv2I7afmQGc2Er54g/6BTDs+CyEWTFawrPc5lAPk872n
         dmirs2Ttda4PnqKgROjUd7CIwz9tdnPCkSyzGIlnzIK6bEyGRSqA1H7/Ze090yaenbxK
         iPzeJNvkLQF6jNvmwsa7eHyXANDHZkBWQs6sisMepYXK+3QyecdSDDX0uIOJQsDjVcfx
         gAyo8YDxkCaJ9wJqVQYaGvOmMuszKOMwbyHS/bu+S6gVRzJL6eI6sGaSbulGjMzjlnVQ
         sYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9PFCuPFcq1FIHz8HOZSI5nxjlQ6hpHQldXpRzabQWk=;
        b=qlA/HyfsinM4zsVl7FMNxYhQeKguVhQhMP+J0wKm8BLPxY3irVpERsDakf7VPPLffm
         SBlcKLkVyexsBT/XpiEaCpbYkKIwE77MmRxP8BZC8sBNNwd0zX3vS3Yr6EWTQNj13D7g
         YS9UjGaZaaekIDm4Bssqwy90ga5C45RLu4p4akvSIWoj1Itzt4lHFYHddQGGet4D4N1M
         A5dBYa7uulDzoXGRaOugVtejSXe6Nkv3Y56686GnCf5BSSZGl9/e88de+VZY2ymcWXHo
         yRJA2VQak4zweWO2GsIUcAsU79bJbM1wgOasI5y7cvZFBC/KG44e7as6a7qHZsbI6csL
         MqtQ==
X-Gm-Message-State: AO0yUKXpg43KgZmq3FZfPjtg4/Fbk9YJqOBAw+aiVr2JJ0HwIqCDhzs3
	4xw83LjOWhrXIDWaIiReJe46CDFOEEcs+H6+Bck=
X-Google-Smtp-Source: AK7set+Yd9KrImooA6uxrXUVmDh+Rcs9q/1b8CgKBFtf9L4gNgxW+NQjjkIdwpsMyntXGCBQF88sBj/dwaEvM3BdnWg=
X-Received: by 2002:adf:dd4f:0:b0:2c5:5297:1f9a with SMTP id
 u15-20020adfdd4f000000b002c552971f9amr4901402wrm.14.1678371608475; Thu, 09
 Mar 2023 06:20:08 -0800 (PST)
MIME-Version: 1.0
References: <20220911174551.653599-1-sergiu.moga@microchip.com>
 <20220925220304.buk3yuqoh6vszfci@mobilestation> <18e6e8a8-6412-7e31-21e0-6becd4400ac1@microchip.com>
 <20220926172454.kbpzck7med5bopre@mobilestation> <1766f6ef-d9d8-04f7-a6bf-0ea6bc0b3d23@linaro.org>
 <f647e713a65f5d3f0f2e3af95c4d0a89@walle.cc> <1849e2c8-54f5-9e56-4ed8-8b0e4a826d04@linaro.org>
 <302ecf0421fe4c99fca3eb0ca2f66127@walle.cc> <5183a184-c72d-3acd-70cd-6aa1e31533f5@linaro.org>
 <03a9f117316ab81f1b5a18100f771e65@walle.cc> <6c2090bf-d102-a333-3a83-03abe81ff70e@linaro.org>
 <460ef5ff3846b409b322ca53559e2476@walle.cc> <b8b61fc0-1e4f-146b-2036-03fda5359585@linaro.org>
 <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
In-Reply-To: <bf57f3aafc3e0a02c81dab905ce9497e@walle.cc>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 9 Mar 2023 22:19:55 +0800
Message-ID: <CAJsYDVJ_UtGqOm_HsN4X4nAuy9svXe4XV6aeG_fg8cWDrgrHMQ@mail.gmail.com>
Subject: Re: [PATCH] spi: Replace `dummy.nbytes` with `dummy.ncycles`
To: Michael Walle <michael@walle.cc>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi!

On Thu, Mar 9, 2023 at 10:04=E2=80=AFPM Michael Walle <michael@walle.cc> wr=
ote:
>
> Am 2023-03-09 14:54, schrieb Tudor Ambarus:
> > On 09.03.2023 15:33, Michael Walle wrote:
> >>>>> The controllers that can talk in dummy ncycles don't need the
> >>>>> dummy.{buswidth, dtr} fields.
> >>>>>
> >>>>> The controllers that can't talk in dummy cycles, but only on a
> >>>>> "byte"
> >>>>> boundary need both buswidth and dtr fields. Assume a flash needs 32
> >>>>> dummy cycles for an op on 8D-8D-8D mode. If the controller does not
> >>>>> have
> >>>>> the buswidth and dtr info, it can't convert the dummy ncycles to
> >>>>> nbytes.
> >>>>> If he knows only that buswidth is 8, it will convert ncycles to 4
> >>>>> bytes.
> >>>>> If dtr is also specified it converts ncycles to 2 bytes.
> >>>>
> >>>> No they don't need it. Lets take your semper flash and assume it
> >>>> needs
> >>>> 12 latency cycles. SPI-NOR will set ncycles to 12 *regardless of the
> >>>> mode
> >>>> or dtr setting*. The controller then knows we need 12 clock cycles.
> >>>> It has
> >>>> then to figure out how that can be achieved. E.g. if it can only do
> >>>> the
> >>>> "old" byte programming and is in quad mode, good for it. It will
> >>>> send 6
> >>>> dummy bytes, which will result in 12 dummy clock cycles, because 1
> >>>> byte
> >>>> takes two clock cycles in quad SDR mode. If its in octal mode, send
> >>>> 12
> >>>> bytes. If its in dual mode, send 3 bytes. Obiously, it cannot be in
> >>>> single bit mode, because it cannot send 1.5 bytes..
> >>>>
> >>>
> >>> You miss the fact that you can have 1-1-4. What buswidth do you use
> >>> for dummy, the address buswidth or the data buswidth?
> >>
> >> Doesn't matter, does it? The driver is free to chose, 1, 4, or
> >> anything
> >> else. You don't sample any data during the dummy phase.
> >> To answer your question: single for instruction, single for address,
> >> whatever you choose for dummy as long as there are ncycles space
> >> between
> >> address and data, and quad for data.
> >
> > Huh? How does the controller chose, based on what?
>
> Based on its own capabilities. It can choose either way. In the end
> what matters is how many clock cycles there are between the address
> and data phase. And you only need to convey that information to the
> SPI controller - your new ncycles.

It does matter. Controller may be designed to actively drive
MOSI/WP/HOLD during single-spi dummy cycles and WP/HOLD
during dual-spi dummy cycles. If the pin modes between the
controller and device mismatched, worst case scenario
the chip may get fried.

--=20
Regards,
Chuanhong Guo

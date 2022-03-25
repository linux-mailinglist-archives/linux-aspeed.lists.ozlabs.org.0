Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 088C74E753B
	for <lists+linux-aspeed@lfdr.de>; Fri, 25 Mar 2022 15:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KQ4W85qDWz30Bw
	for <lists+linux-aspeed@lfdr.de>; Sat, 26 Mar 2022 01:40:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=WWru200i;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::112c;
 helo=mail-yw1-x112c.google.com; envelope-from=aaelhaj@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=WWru200i; dkim-atps=neutral
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KQ4W429ndz2yb9
 for <linux-aspeed@lists.ozlabs.org>; Sat, 26 Mar 2022 01:39:58 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-2db2add4516so85611087b3.1
 for <linux-aspeed@lists.ozlabs.org>; Fri, 25 Mar 2022 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=XQOh36VqtR/Hbed8EjkM9HervQsTd5TscgD9imdZ5Cg=;
 b=WWru200i/Q62WUypjJpP2vgxmG1Fvk0xx53OQ5aY5OnKeHg8s3L2COba8nAsAdhOa4
 evVQm1xHoZEDKxctWSjubCzFC3MT8/TspPRMX1hXlU39oxaOryxSkutwv/2zxPHZtI+t
 pLue67RoS7pwcjDXGYpV47tVroKmTdlluXcga5AGeEPKyGt5955y5rYaAby8lHot1aoz
 Q3cq/+fxWJlTRFcqkun7vpAnD5cXQAlpm3/8Am9Qnccz8qPMstnyvVq1MUbX9OCPTHaM
 PK7wZNb18jxptZ7xWhm4PHM/kqFedwtv6aGLGMm179W4YhQIhgJyhpPh7GGK/GiSfnho
 yIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=XQOh36VqtR/Hbed8EjkM9HervQsTd5TscgD9imdZ5Cg=;
 b=zZTYp0DPHr1tj5ReMyVCAujap3xDhTefyI7c3EqAiD38MO06pykAVTovhB1PAZkVO3
 cX6tEB5js5ykHRTDup2Z91iPnMrbrY7Y3MDehordXqhG+9JqVenBcxyQhLqiOe7vhPzQ
 X0F9ucEm5vmgElaZ9BXBuG2hEVeRSo4sLISc/cypuODEphUGAP2ofPiQ610m9qcV3CxT
 BKfGDYcwCZ4Ox8yLAfhJaRHhrNzQbLUIREfMrSASUkv0YarzHqOWZkmrLUI0W9tbMjQC
 4k0hehXXEAppDC90kmgbcn/jDjD8JOQXiChFGPJv7roURrU+eRJNwW318xbPQbND91fU
 D7zA==
X-Gm-Message-State: AOAM533CPs5CNFCGuJYSACGLt9Qdy2OtftSm2ZIGDV/lbOtHxgBKG/9M
 9+VED7OtzhP5UtGnYv4W1YpvwyyPSo452zPYhCjNdHuSRHYxOw==
X-Google-Smtp-Source: ABdhPJyhBdTqxkvBlshS3n5JL4LFb4ODDvIlI+p2TJWJ395roQT7tECLsdPsqFPI4jO/kmVJo08aRdvJMZHVJX7Jg9U=
X-Received: by 2002:a0d:d44e:0:b0:2e5:dc71:c82b with SMTP id
 w75-20020a0dd44e000000b002e5dc71c82bmr10622602ywd.42.1648219193248; Fri, 25
 Mar 2022 07:39:53 -0700 (PDT)
MIME-Version: 1.0
From: Ali El-Haj-Mahmoud <aaelhaj@google.com>
Date: Fri, 25 Mar 2022 10:39:27 -0400
Message-ID: <CAFPZpNbNc5Fx1tBtmM1x0n-qEB_qp+wSSrR2+_0bxPrPyh1xMw@mail.gmail.com>
Subject: aspeed2500 SPI1 control at run-time with OpenBMC
To: linux-aspeed@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

I'm working on an aspeed2500-based system:
https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed-bmc-tyan-s8036.dts.

We would like to be able to update the host BIOS (SPI1) from the BMC.
Something along these lines:

- Upload a BIOS image to the BMC. Validate.
- Power down the host.
- Switch SPI1 control (SCU70[13:12]) to 'master' to connect to BMC.
- Flash the new image.
- Switch SPI1 to 'passthru' to connect back to the host.
- Power on the host.

I'm able to accomplish this in a debug build using devmem to control
SCU70[13:12]. However, it seems this should be doable via pinctrl
instead (https://github.com/torvalds/linux/blob/master/drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c#L515-L520),
but I'm not able to get it to work.

To begin with, a patch similar to
https://lists.ozlabs.org/pipermail/openbmc/2016-November/005392.html
is needed to allow modifying SCU70[13:12] via pinctrl.

After that, I'm not sure how to configure SPI1 in the DTS.

With the config below, SPI1 is connected to the BMC, and the host cannot boot:

&spi1 {
status = "okay";
pinctrl-names = "default";
pinctrl-0 = <&pinctrl_spi1_default>;
pinctrl-1 = <&pinctrl_spi1passthru_default>;
...
};

I can still switch it to passthru at run time and boot the host, but
that's not the behavior I'd like:

$ echo SPI1PASSTHRU SPI1PASSTHRU >
/sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pinmux-select

If I switch the order of the pinctrls, SPI1 is connected to the host,
and I cannot access it from the BMC, even if I try to explicitly
switch it:

&spi1 {
status = "okay";
pinctrl-names = "default";
pinctrl-0 = <&pinctrl_spi1passthru_default>;
pinctrl-1 = <&pinctrl_spi1_default>;
...
};

And this has no effect:
$ echo SPI1 SPI1 >
/sys/kernel/debug/pinctrl/1e6e2080.pinctrl-aspeed-g5-pinctrl/pinmux-select

Is this use-case supported through pinctrl? Am I missing something here? Thanks!

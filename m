Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F4D4045CE
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 08:52:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H4qSm18cSz2yJT
	for <lists+linux-aspeed@lfdr.de>; Thu,  9 Sep 2021 16:52:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=gyFgjz4/;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=yulei.sh@bytedance.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=bytedance-com.20150623.gappssmtp.com
 header.i=@bytedance-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=gyFgjz4/; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H4qSd4KD7z2xr0
 for <linux-aspeed@lists.ozlabs.org>; Thu,  9 Sep 2021 16:52:31 +1000 (AEST)
Received: by mail-oi1-x229.google.com with SMTP id y128so1302541oie.4
 for <linux-aspeed@lists.ozlabs.org>; Wed, 08 Sep 2021 23:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n/dbtsQItzFXG3VUtr5tpCtogf60jhbRfY1HqI+6zeg=;
 b=gyFgjz4/3LjQCakqfOSTVUCjrvKZcjbZHuTwspXxUdu8JCq0c29GPSXdlOJKg8kEX/
 whefJmwhR4dTsN+4Gtszow3uSHaLa5N4E7aWgjz+fNO0IEHOy7H0M4nx65A/RsyTaZOd
 bFa5if1a/nFRzVskAHrouMI9W4Vnu7ZFnuBB87FdKR5L0hsBQlzU0YTb2e3JofdAJqy1
 byh6cJb/po6bcwbieRkpagopbAf7WGXNJVdA8iTq3Q3KX+yphpw35xa2wVt9WnPNA9xT
 i4CI2w7tN6MPiCB+aeM+VQefMXj5aKzAEQSX6vvBYMNa7rfqiB2GgaLjhYbOhkOVqtET
 o5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n/dbtsQItzFXG3VUtr5tpCtogf60jhbRfY1HqI+6zeg=;
 b=llYCctF+EaV7xaZWMG026BpzkAcCdcGxB8kvh8dD5gQzffPqDfSnGuMCOs21cZ41jD
 Xp2svaRxZ6C1thwXbYcUgfnPecU0+wMheuK64McOejAYNlCQrIY8J48W7cY2GGhRPosy
 vlpSC3KtxVtjV0lHUzSYba5O8Nd1YBjmLPBFP19rSgGnZhi6bDVN9S1Qe06dQVTjZLL9
 skKOkLFBcGs6tJHjQScBMibFUi7EVEX7aw8L+s5l3A/BhzML7MZDeTeTKuYr4jC4xSDk
 p9uE7ltnMUKoBvrkHpbIHBDbG/TFH+P4n3ZUwTg/ioPxkf5lrPZbM4aAivRBBRW6nLNu
 VTPQ==
X-Gm-Message-State: AOAM531RR+MhOh5/xanA3V3eciYs3QMqGF6/ZMdlaULRDfXCVR2G2ixs
 DLmlyOugzW6s7T+9Wd+CqXrCL0zu34B8fgE1cyfAdA==
X-Google-Smtp-Source: ABdhPJxYlOZA1Z3SpX9pxnUob+P/iJhoYZcvVtQEHgSSu3BJmDqo3PtVCpNE/CpESGExUkz55CWZKfuAz539Xbp3cZY=
X-Received: by 2002:a05:6808:1294:: with SMTP id
 a20mr962310oiw.4.1631170348266; 
 Wed, 08 Sep 2021 23:52:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
In-Reply-To: <20210902021817.17506-1-chiawei_wang@aspeedtech.com>
From: Lei Yu <yulei.sh@bytedance.com>
Date: Thu, 9 Sep 2021 14:52:17 +0800
Message-ID: <CAGm54UERFkOLXtG3wwL9x1-HAXjmRoaG4ZRbZZOLjP1bLZ=LSg@mail.gmail.com>
Subject: Re: [External] [PATCH v2 0/3] arm: aspeed: Add UART routing support
To: Chia-Wei Wang <chiawei_wang@aspeedtech.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 openbmc <openbmc@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, lee.jones@linaro.org,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>, Oskar Senft <osk@google.com>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

The patches are tested on meta-g220a build and it works fine with some
changes in the sysfs path[1].

Tested-by: Lei YU <yulei.sh@bytedance.com>

[1]: https://github.com/openbmc/meta-bytedance/blob/master/meta-g220a/recipes-phosphor/console/obmc-console/obmc-console%40.service#L7-L10

On Thu, Sep 2, 2021 at 10:20 AM Chia-Wei Wang
<chiawei_wang@aspeedtech.com> wrote:
>
> Add UART routing driver and the device tree nodes.
>
> v2:
>  - Add dt-bindings
>  - Add ABI documents for the exported sysfs interface
>  - Revise driver implementation suggested by Joel
>
> Chia-Wei Wang (3):
>   dt-bindings: aspeed-lpc: Add UART routing compatible string
>   soc: aspeed: Add UART routing support
>   ARM: dts: aspeed: Add uart routing to device tree
>
>  .../testing/sysfs-driver-aspeed-uart-routing  |  15 +
>  .../devicetree/bindings/mfd/aspeed-lpc.txt    |  22 +
>  arch/arm/boot/dts/aspeed-g5.dtsi              |   6 +
>  arch/arm/boot/dts/aspeed-g6.dtsi              |   6 +
>  drivers/soc/aspeed/Kconfig                    |  10 +
>  drivers/soc/aspeed/Makefile                   |   9 +-
>  drivers/soc/aspeed/aspeed-uart-routing.c      | 601 ++++++++++++++++++
>  7 files changed, 665 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-aspeed-uart-routing
>  create mode 100644 drivers/soc/aspeed/aspeed-uart-routing.c
>
> --
> 2.17.1
>


-- 
BRs,
Lei YU

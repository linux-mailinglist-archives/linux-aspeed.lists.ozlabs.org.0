Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 264EB2D9B8E
	for <lists+linux-aspeed@lfdr.de>; Mon, 14 Dec 2020 16:57:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CvmHz1MxYzDqLJ
	for <lists+linux-aspeed@lfdr.de>; Tue, 15 Dec 2020 02:57:51 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::944;
 helo=mail-ua1-x944.google.com; envelope-from=ulf.hansson@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mItKLRyC; dkim-atps=neutral
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CvmHr3kBdzDqC3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 15 Dec 2020 02:57:39 +1100 (AEDT)
Received: by mail-ua1-x944.google.com with SMTP id f29so5623592uab.0
 for <linux-aspeed@lists.ozlabs.org>; Mon, 14 Dec 2020 07:57:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dXj2L/gpA5Z+dEMYx7lFyvYb6eATLj9JT43cDhRuOs4=;
 b=mItKLRyCuzJrSK8Od8x+kXuTZfDwYKDtxNWWYttW2xt9pJ340SAw3D74IPyF1TRQkj
 bf6Zky0yKI6L5+LP6Z+6PDJ024szLWmlpSOptu0arTk+UGSLhPZE2fwXhrFv3RYdIacB
 31JgIFaLxn4sEDuUi0vZDA2LtAACNqERBnyxoq/PT6wI7jXjxKi4StzKuXaFdFifd1Pi
 Np5Drtzn1tBr0Ejw9giN/sHfJXz9aqR5upRR+I5gHTMPduzmzJZW8G9SwaWQtaD9ID/0
 34rL6Z+EfpBjoej5wMc+RbiSM75QUYfZ1qUGbnMlw6nySB1TQ1XwoGsAd9RZg9dB7AMi
 47XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dXj2L/gpA5Z+dEMYx7lFyvYb6eATLj9JT43cDhRuOs4=;
 b=tKCrmbx1NSXhrukLXF00O+B1Dv+/T33ykVveJmKw6QPLNr2hgdnZg55ZaUaX+KUSiO
 lndKZvWk4dy+z9tQq2w6U7g5pU0UNCd9nb4VTUeAOsAAQAdXWDCaB3oOxrTWNuJw0mDO
 yvuXqKo6BFkp7kk7eQI09o33Q8YdEnctADGmOtCT17sNOvX39RLgB2sW9Wva921WPAQt
 hU6ZFLI3EcCK9hUQlM2cKuUJCTFjDLfBHMirqOh4o0gX7+RM871dROPFL6v44fV0fFSc
 MzOncA8KNBTmeQw101mRakwfI2wE79/JzOmYTSP4fiX/ZdjaqEdvkk2JbL/Dpok69OWA
 x47Q==
X-Gm-Message-State: AOAM531uzOK3ouSe3gzuYRYZok/ip/ThaWoxhcH/cziV62I3vQMyYAJk
 2QNbeW9Xjbbm4gMZBLp0nmhBw/tYlJPHzR/B1MJ7Vw==
X-Google-Smtp-Source: ABdhPJzdfWPRBW0/f0jpVNrHb1/fu5VTxg/DQ0L43Zjos4Zi2HwXvGdkwhaNygxEwdpDSjUu9VyxZY/jyLL25Bv2K38=
X-Received: by 2002:a9f:2213:: with SMTP id 19mr23369715uad.15.1607961455333; 
 Mon, 14 Dec 2020 07:57:35 -0800 (PST)
MIME-Version: 1.0
References: <20201208012615.2717412-1-andrew@aj.id.au>
In-Reply-To: <20201208012615.2717412-1-andrew@aj.id.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 14 Dec 2020 16:56:59 +0100
Message-ID: <CAPDyKFpCiA_fT0tQ58z_3mt183RJ30QZWE_qjbmXGO3imHqMzw@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] mmc: sdhci-of-aspeed: Expose phase delay tuning
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: DTML <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Dec 2020 at 02:26, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series implements support for the MMC core clk-phase-* devicetree bindings
> in the Aspeed SD/eMMC driver. The relevant register was exposed on the AST2600
> and is present for both the SD/MMC controller and the dedicated eMMC
> controller.
>
> v5 fixes some build issues identified by the kernel test robot.
>
> v4 can be found here:
>
> https://lore.kernel.org/linux-mmc/20201207142556.2045481-1-andrew@aj.id.au/
>
> The series has had light testing on an AST2600-based platform which requires
> 180deg of input and output clock phase correction at HS200, as well as some
> synthetic testing under qemu and KUnit.
>
> Please review!

FYI, other than the comment I had on patch1, I think the series looks
good to me.

[...]

Kind regards
Uffe

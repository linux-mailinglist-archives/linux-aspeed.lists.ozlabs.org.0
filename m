Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F40B110097
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Dec 2019 15:48:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47S4bR51qwzDqXP
	for <lists+linux-aspeed@lfdr.de>; Wed,  4 Dec 2019 01:48:03 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="NHAZ3wH2"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47S4bH53qyzDqQH
 for <linux-aspeed@lists.ozlabs.org>; Wed,  4 Dec 2019 01:47:55 +1100 (AEDT)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com
 [209.85.219.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC5EB2084B
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Dec 2019 14:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575384473;
 bh=qoEpR+iz5sa+F9skDmBKFFgJNfBR3Zy5GUGd1/9m/gQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NHAZ3wH2XrkrRW3Vb4k1ssmKydPyl3/8ap20PpuI78OfuRUOen5uNTXxq7Luu0/09
 OmyboqlXn3uRHlE5W/DIm96+HpsmaUAy3sSqB5ESw4NeeMr8kdJzIq/fuCb27NY6Bm
 EFDSC0c+p8v+uTQBZuU37XqEFP2uX9+zmKcEyDjk=
Received: by mail-qv1-f53.google.com with SMTP id b18so1604916qvy.3
 for <linux-aspeed@lists.ozlabs.org>; Tue, 03 Dec 2019 06:47:52 -0800 (PST)
X-Gm-Message-State: APjAAAVsI+F/HaMopBfRNnUdGHANzKIKyom+Srr6i/yNaaYJWuvKZ2nL
 pqBmHfjQGz/W4e48gvCgY2XVY2XRbn2eXzusfA==
X-Google-Smtp-Source: APXvYqxrMnC94tLm+z/m6J/edWdsA+e9+yTSEaG1G1r+Sc9Beij7suS2pnqDw5WIbatRieWqQvxMMTtm91WsEIvREJ0=
X-Received: by 2002:ad4:450a:: with SMTP id k10mr5131884qvu.136.1575384471940; 
 Tue, 03 Dec 2019 06:47:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
In-Reply-To: <cover.08e3a6c95159f017b753d0f240086d1a7923758b.1575369656.git-series.andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 3 Dec 2019 08:47:40 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLMs1MsNXMFTCVdrkNNx5ktg0_Q=zf6xgiTkeys-T+CNg@mail.gmail.com>
Message-ID: <CAL_JsqLMs1MsNXMFTCVdrkNNx5ktg0_Q=zf6xgiTkeys-T+CNg@mail.gmail.com>
Subject: Re: [PATCH 00/14] ARM: dts: aspeed: Cleanup dtc warnings
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Xo Wang <xow@google.com>, linux-aspeed@lists.ozlabs.org,
 Ken Chen <chen.kenyy@inventec.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, anoo@us.ibm.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yao.yuan@linaro.org, a.filippov@yadro.com,
 Patrick Venture <venture@google.com>,
 =?UTF-8?B?QnJpYW5DLlcg5qWK5ZiJ5YGJIFRBTyBZYW5n?= <yang.brianc.w@inventec.com>,
 Stefan M Schaeckeler <sschaeck@cisco.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Dec 3, 2019 at 6:02 AM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> Hello,
>
> This series is based on an RFC-ish series I sent quite some time ago to which I
> have only just been able to circle back. The previous discussion can be found
> here:
>
> https://lore.kernel.org/lkml/20190726053959.2003-1-andrew@aj.id.au/
>
> I've split, shuffled and rebased the series a little, with at least one extra
> cleanup for the g6 dtsi. This series is just the devicetree changes, the IPMI
> KCS changes will be posted separately shortly.
>
> Combined with the KCS changes we achieve similar stats to the RFC series,
> reducing 264 warnings to 6.
>
> I've added each patches' tags from last time, but please glance over them
> again.
>
> Cheers,
>
> Andrew
>
> Andrew Jeffery (14):
>   dt-bindings: pinctrl: aspeed: Add reg property as a hint
>   dt-bindings: misc: Document reg for aspeed,p2a-ctrl nodes
>   ARM: dts: aspeed-g5: Move EDAC node to APB
>   ARM: dts: aspeed-g5: Use recommended generic node name for SDMC
>   ARM: dts: aspeed-g5: Fix aspeed,external-nodes description
>   ARM: dts: vesnin: Add unit address for memory node
>   ARM: dts: fp5280g2: Cleanup gpio-keys-polled properties
>   ARM: dts: swift: Cleanup gpio-keys-polled properties
>   ARM: dts: witherspoon: Cleanup gpio-keys-polled properties
>   ARM: dts: aspeed: Cleanup lpc-ctrl and snoop regs
>   ARM: dts: aspeed: Add reg hints to syscon children
>   ARM: dts: aspeed-g5: Sort LPC child nodes by unit address
>   ARM: dts: aspeed-g6: Cleanup watchdog unit address
>   ARM: dts: ibm-power9-dual: Add a unit address for OCC nodes
>
>  Documentation/devicetree/bindings/misc/aspeed-p2a-ctrl.txt            |  1 +
>  Documentation/devicetree/bindings/pinctrl/aspeed,ast2400-pinctrl.yaml |  3 +++
>  Documentation/devicetree/bindings/pinctrl/aspeed,ast2500-pinctrl.yaml |  3 +++
>  arch/arm/boot/dts/aspeed-bmc-arm-centriq2400-rep.dts                  |  4 ----
>  arch/arm/boot/dts/aspeed-bmc-arm-stardragon4800-rep2.dts              |  4 ----
>  arch/arm/boot/dts/aspeed-bmc-inspur-fp5280g2.dts                      | 11 +++++++----
>  arch/arm/boot/dts/aspeed-bmc-intel-s2600wf.dts                        |  4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-lanyang.dts                          |  4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts                          |  4 ----
>  arch/arm/boot/dts/aspeed-bmc-opp-swift.dts                            |  6 ------
>  arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts                           |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-witherspoon.dts                      |  6 ------
>  arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts                            |  2 --
>  arch/arm/boot/dts/aspeed-g4.dtsi                                      | 21 ++++++++++++---------
>  arch/arm/boot/dts/aspeed-g5.dtsi                                      | 49 ++++++++++++++++++++++++++-----------------------
>  arch/arm/boot/dts/aspeed-g6.dtsi                                      |  2 +-
>  arch/arm/boot/dts/ibm-power9-dual.dtsi                                |  4 ++--
>  17 files changed, 56 insertions(+), 74 deletions(-)

Other than patch 5, for the series:

Reviewed-by: Rob Herring <robh@kernel.org>

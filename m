Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A695F2E9BA
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 02:34:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45DpVw0SCCzDqK5
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 10:34:32 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::742; helo=mail-qk1-x742.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="nW0+RjTg"; 
 dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DpVl5Y05zDqJH
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2019 10:34:23 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id l128so2786812qke.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 29 May 2019 17:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KHD+sHVUPLQmygDU5dgl8aDe2PTeVVrxe8ejiYsJbzA=;
 b=nW0+RjTgr112JeSC0qx2gUZmFr6cGCDqdl+BpCHWqJuE+d78Bs5iJJebC6syz05H1g
 APITCHaqFOtnhiPTw51uDWFk0zRdcaug6U0SqwHUL+FX62RpIXyMwquSehD4D9wCa9Nz
 DjkgdB2ypi/hj1qa/QKZLnb8qvc1wkMBkifao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KHD+sHVUPLQmygDU5dgl8aDe2PTeVVrxe8ejiYsJbzA=;
 b=aLRJnwL38Zx3uR529lSmVLcN0Y3bNaMGm4JrovVjr3iDCuh1HDXvrBXYZvzWbIKPBo
 +kJOLZKxXBYv0l4SumSVW5v40NDSkYso6azZghmyBhr3ad1XaaHDk9np3BJ/4LaQCdOl
 lSW2/H0dqIrJ8kdpqvSk21M+k66xVhZr5+DS2c+BoQUHOPT1QuQZkKNbAw98bNBZUMwL
 2miWWiWx9t2B0KVw0IWrWUb8myN1S9VnIqynUO0yESgqTP76Ha6DVxqsWnPUjQmNlXXP
 FJjX7qlNVbWA4P7uE3PwRt6CMJEfZKtP5MmhQggtKlYLMpiG14nriqZmuS0IOT+W4vAI
 tKAw==
X-Gm-Message-State: APjAAAXJ2Pt5u5uCrw0y8jOrm/ReiauG/oAq7VnLo+AWjCei3DWPFEdP
 GiWiDKvQQouT7/EvnFQhZQw4egHBU1g2VWu+gWw=
X-Google-Smtp-Source: APXvYqxYyCeKyYUztJa3DHENKeZigts1pQtuupR+90lPSZNjZI5bKFuOpg4mU0O5bqKNHFmvb0879Dook4z1MhjB/qo=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr713236qke.76.1559176459320;
 Wed, 29 May 2019 17:34:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190527112753.1681-1-a.filippov@yadro.com>
In-Reply-To: <20190527112753.1681-1-a.filippov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 May 2019 00:34:04 +0000
Message-ID: <CACPK8XeXh8uiQ6f5LWJRBJ=VwMAvdPHOo34uHhWZyMFBG2HVqw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: g4: add video engine support
To: Alexander Filippov <a.filippov@yadro.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Alexander,

On Mon, 27 May 2019 at 11:28, Alexander Filippov <a.filippov@yadro.com> wrote:
>
> Add a node to describe the video engine and VGA scratch registers on
> AST2400.

The scratch registers are unrelated to the video engine. As Andrew
pointed out, the bindings are not upstream either.

Can you re-spin this patch wit just the video engine changes?

We also need a platform to enable and test this on. Can you submit the
device tree for your system?

>
> These changes were copied from aspeed-g5.dtsi
>
> Signed-off-by: Alexander Filippov <a.filippov@yadro.com>
> ---
>  arch/arm/boot/dts/aspeed-g4.dtsi | 62 ++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
> index 6011692df15a..adc1804918df 100644
> --- a/arch/arm/boot/dts/aspeed-g4.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g4.dtsi
> @@ -168,6 +168,10 @@
>                                         compatible = "aspeed,g4-pinctrl";
>                                 };
>
> +                               vga_scratch: scratch {
> +                                       compatible = "aspeed,bmc-misc";
> +                               };
> +
>                                 p2a: p2a-control {
>                                         compatible = "aspeed,ast2400-p2a-ctrl";
>                                         status = "disabled";
> @@ -195,6 +199,16 @@
>                                 reg = <0x1e720000 0x8000>;      // 32K
>                         };
>
> +                       video: video@1e700000 {
> +                               compatible = "aspeed,ast2400-video-engine";
> +                               reg = <0x1e700000 0x1000>;
> +                               clocks = <&syscon ASPEED_CLK_GATE_VCLK>,
> +                                        <&syscon ASPEED_CLK_GATE_ECLK>;
> +                               clock-names = "vclk", "eclk";
> +                               interrupts = <7>;
> +                               status = "disabled";
> +                       };
> +
>                         gpio: gpio@1e780000 {
>                                 #gpio-cells = <2>;
>                                 gpio-controller;
> @@ -1408,6 +1422,54 @@
>         };
>  };
>
> +&vga_scratch {
> +       dac_mux {
> +               offset = <0x2c>;
> +               bit-mask = <0x3>;
> +               bit-shift = <16>;
> +       };
> +       vga0 {
> +               offset = <0x50>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +       vga1 {
> +               offset = <0x54>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +       vga2 {
> +               offset = <0x58>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +       vga3 {
> +               offset = <0x5c>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +       vga4 {
> +               offset = <0x60>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +       vga5 {
> +               offset = <0x64>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +       vga6 {
> +               offset = <0x68>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +       vga7 {
> +               offset = <0x6c>;
> +               bit-mask = <0xffffffff>;
> +               bit-shift = <0>;
> +       };
> +};
> +
>  &sio_regs {
>         sio_2b {
>                 offset = <0xf0>;
> --
> 2.20.1
>

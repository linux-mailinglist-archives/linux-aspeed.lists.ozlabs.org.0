Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9AE158572
	for <lists+linux-aspeed@lfdr.de>; Mon, 10 Feb 2020 23:24:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GgRg2Gj3zDqMN
	for <lists+linux-aspeed@lfdr.de>; Tue, 11 Feb 2020 09:23:59 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=FgTcvQWW; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GgRT6DcNzDqLv
 for <linux-aspeed@lists.ozlabs.org>; Tue, 11 Feb 2020 09:23:49 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id q15so8223525qke.9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 10 Feb 2020 14:23:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vtc2iHO5ssqdQWlZbYpNOYjs7NPN+OkfmGi7EwW4+Cw=;
 b=FgTcvQWWhvbFryDssRGO6xJWs5roRRi7pj6F2lGuCKhoWUJC2n4I/mNnRGIzEc6x2M
 MCO3afKZAmymUbSJ2kjINRtbtbNYPLzRMEdJr84duHUQVo5bbZdX2AUMkzTP62MUYXOs
 JNgdEotYxbmqZrmJZZVFIxEo1beFo2EvE52vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vtc2iHO5ssqdQWlZbYpNOYjs7NPN+OkfmGi7EwW4+Cw=;
 b=WPA+kdZsVVJsGDaBOnzkEgzOwDjdy8GugSfh38Spy0w+lQ7p7js4wTUN2EMQop10Xl
 UgXi0oMIyapu1o3U2ze3XTX6i27IxuZnnVA8VmwSoJhFs4+GzsVRzwVOJytmOa0YY2HC
 e6KDNcZRNNSlHNWTnIbN6USayeGpGokTIz3cPcktDJmk8RlaIEX/icdvrVVr3qb4ygvv
 TaUz28PHTxCAa3gO4Zrlfrt2eB++++VhHQWgC9xLCmEHwfLG76XdVnnIlYSS1PYpu4X3
 6KfSyHi+XQgs9LkQzu1DOP2O6VLxAMYygYJ0Bp2pM+lAySxvYMNMBKYUZrqKx0VLSfBo
 rSnQ==
X-Gm-Message-State: APjAAAXHIrS4a8YJPlk2oSSTXqaBHRLbXwRZPUfQ9aQIP9Muyp4GbqKT
 bF/yU0YM2N3ZjglKlQo0RjTjCGJ0yXsVIx5X7Xw=
X-Google-Smtp-Source: APXvYqyZdGpzcKUOEIzHRw7qYRL07DZQdkQJ0/5JSAwE0jE+HVmYKoptJ7wpd88HybHU1+QIrsDGwQWL0h/VjAghNpo=
X-Received: by 2002:a37:c07:: with SMTP id 7mr107082qkm.414.1581373426189;
 Mon, 10 Feb 2020 14:23:46 -0800 (PST)
MIME-Version: 1.0
References: <20200130214626.2863329-1-vijaykhemka@fb.com>
In-Reply-To: <20200130214626.2863329-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 10 Feb 2020 22:23:34 +0000
Message-ID: <CACPK8Xfo1NcNmORHtpfDQzYQrLV0B=6+_nUtPftiHQoT6GrpPA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: tiogapass: Add IPMB device
To: Rob Herring <robh+dt@kernel.org>
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
 devicetree <devicetree@vger.kernel.org>, Sai Dasari <sdasari@fb.com>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Thu, 30 Jan 2020 at 21:46, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Adding IPMB devices for facebook tiogapass platform.
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>
> ---
>  arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index fb7f034d5db2..1cb5b9bf468f 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -5,6 +5,7 @@
>
>  #include "aspeed-g5.dtsi"
>  #include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/i2c/i2c.h>
>
>  / {
>         model = "Facebook TiogaPass BMC";
> @@ -428,6 +429,12 @@
>  &i2c4 {
>         status = "okay";
>         // BMC Debug Header
> +       multi-master;
> +       ipmb0@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;

This causes dtc to warn:

../arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:521.11-525.4:
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10: I2C
bus unit address format error, expected "40000010"
../arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts:523.3-30:
Warning (i2c_bus_reg): /ahb/apb/bus@1e78a000/i2c-bus@380/ipmb0@10:reg:
I2C address must be less than 10-bits, got "0x40000010"

The bindings mention:

 Another flag is I2C_OWN_SLAVE_ADDRESS to mark addresses on which we listen to
be devices ourselves.

include/dt-bindings/i2c/i2c.h:#define I2C_OWN_SLAVE_ADDRESS     (1 << 30)

It appears dtc needs to be fixed to not warn when seeing this value in
an i2c reg node?

Cheers,

Joel



> +               i2c-protocol;
> +       };
>  };
>
>  &i2c5 {
> @@ -509,6 +516,12 @@
>  &i2c9 {
>         status = "okay";
>         //USB Debug Connector
> +       multi-master;
> +       ipmb0@10 {
> +               compatible = "ipmb-dev";
> +               reg = <(0x10 | I2C_OWN_SLAVE_ADDRESS)>;
> +               i2c-protocol;
> +       };
>  };
>
>  &pwm_tacho {
> --
> 2.17.1
>

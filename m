Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3888465E0D
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Dec 2021 07:07:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4QTk5Qbgz304R
	for <lists+linux-aspeed@lfdr.de>; Thu,  2 Dec 2021 17:07:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=WQqwlmvR;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=WQqwlmvR; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4QTb5kRTz2yfb
 for <linux-aspeed@lists.ozlabs.org>; Thu,  2 Dec 2021 17:07:13 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id g9so22134576qvd.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 01 Dec 2021 22:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pO6cSPpB1t4D4Pt6yGxXTPztMRKSF+ZBfosbEur348s=;
 b=WQqwlmvRc7h3U/hML3l03I0t4e3qisI1b4V2HjA0xVFEbfBVU9XayDyazQKhYOBvI6
 CIINAJdh0ETNh44u9uNGs9wuWpfXeaxJ+FC9dNQHToDBfj46zVL3XkcZjj3R4adqZnSE
 gcuZ5D8CClz+f/9Ab3WdItQj0IdlpHCT+Jvsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pO6cSPpB1t4D4Pt6yGxXTPztMRKSF+ZBfosbEur348s=;
 b=i/rxP7BhKmd7eZViQ3qVdhlkftkbGoxwnslMxbRK6sr+p0yu51vr9NKHcw0XYv7OF0
 8y5S0Bv5FYRMbNYFX3XoveGj2JZzU5M+wpIDWsLFUJdlv0W6jvIv5//XkG/GV4b8idWl
 i3r3BhHiNRSG0VRx5kq5TSaYqee+MK7YYGIixq2MDYTUFT4po44GRG0rTv6Vr2LabKPz
 KqmAXZKnKDkqLjv+OZOBSsAfgNn1cb6A7Mwy5O+RuVtibv64auO4D80+JOM066dYD3og
 MYQsmWB7wz/w1XHLK8uWer5m/wvW8SCv4FoNBYUyx6Bj/bhto4UYn16cMRdBcsXMqyXh
 j9hw==
X-Gm-Message-State: AOAM530JlzeYt6b4C26tptqLYzzRjUGN9eZIEdODYvnjqfzNdav8AZcE
 xiytjPwIFR69k1O8/CPBbx7Ua4et6XKHwMkCsY0=
X-Google-Smtp-Source: ABdhPJycPsKdS5BQs2tO3HKSSx2b+qrhYgKgRswIukwPM6sYv5nM1bdN8ivu0gqB9MjmtRlGZpxLH0CFcI0ixtmedrg=
X-Received: by 2002:ad4:5ce8:: with SMTP id iv8mr11447207qvb.21.1638425228334; 
 Wed, 01 Dec 2021 22:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20211201033738.121846-1-howard.chiu@quantatw.com>
In-Reply-To: <20211201033738.121846-1-howard.chiu@quantatw.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 2 Dec 2021 06:06:56 +0000
Message-ID: <CACPK8Xd9i_8LcnKXwA7myots9N=fH0FnpnPdzXAkiRW9=LSVTA@mail.gmail.com>
Subject: Re: [PATCH v6] ARM: dts: aspeed: Adding Facebook Bletchley BMC
To: Howard Chiu <howard10703049@gmail.com>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Patrick Williams <patrick@stwcx.xyz>, SoC Team <soc@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Howard Chiu <howard.chiu@quantatw.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Howard,

Please just cc the people that get_maintainers.pl spits out. You don't
want to cc soc@kenrel.org (that's for when patches are ready to apply,
and something that the maintainer for the platform will handle).

$ ./scripts/get_maintainer.pl -f
arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Joel Stanley <joel@jms.id.au> (supporter:ARM/ASPEED MACHINE SUPPORT)
Andrew Jeffery <andrew@aj.id.au> (reviewer:ARM/ASPEED MACHINE SUPPORT)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
linux-arm-kernel@lists.infradead.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
linux-aspeed@lists.ozlabs.org (moderated list:ARM/ASPEED MACHINE SUPPORT)
linux-kernel@vger.kernel.org (open list)


On Wed, 1 Dec 2021 at 03:39, Howard Chiu <howard10703049@gmail.com> wrote:
>
> Initial introduction of Facebook Bletchley equipped with
> Aspeed 2600 BMC SoC.

I like to have some background on the machine, as it provides context
for the review. Is it a x86 server? A x86 switch? Of course if this
information is confidential then that's fine to omit it, only provide
what you can.

>
> Signed-off-by: Howard Chiu <howard.chiu@quantatw.com>
>


Put the changes below under ---. This is so they are not included in
the commit message when added to the kernel.

If the information is relevant, then put it in the commit message
above your s-o-b.

> Change since v5:
> - Add an EEPROM on i2c-7
> - Change address of FUSB302 to 0x22
> - Assign interrupt pin to FUSB302
> - Rework pin assignment of pca9539
>
> Change since v4:
> - Change address of TMP421 on i2c-12 to 0x4d
>
> Change since v3:
> - Add a TMP421 on i2c-10
>
> Change since v2:
> - Remove uart5 workaround
> - Remove gpio nodes of pca9552/pca9539
> - Modify gpio-line-name of led/power/presence pins with openbmc pattern
> - Add MP5023 devices
>
> Change since v1:
> - Keep sorted in Makefile
> - Change baudrate to 57600 from 115200
> - Rename node *-ember to *-amber
> - Use openbmc-flash-layout-128.dtsi
> ---
>  arch/arm/boot/dts/Makefile                    |   1 +
>  .../dts/aspeed-bmc-facebook-bletchley.dts     | 760 ++++++++++++++++++
>  2 files changed, 761 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
>
> diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> index 0de64f237cd8..b804b577010a 100644
> --- a/arch/arm/boot/dts/Makefile
> +++ b/arch/arm/boot/dts/Makefile
> @@ -1482,6 +1482,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>         aspeed-bmc-arm-stardragon4800-rep2.dtb \
>         aspeed-bmc-asrock-e3c246d4i.dtb \
>         aspeed-bmc-bytedance-g220a.dtb \
> +       aspeed-bmc-facebook-bletchley.dtb \
>         aspeed-bmc-facebook-cloudripper.dtb \
>         aspeed-bmc-facebook-cmm.dtb \
>         aspeed-bmc-facebook-elbert.dtb \
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> new file mode 100644
> index 000000000000..c013ebe1704a
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts
> @@ -0,0 +1,760 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2021 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +#include <dt-bindings/usb/pd.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +       model = "Facebook Bletchley BMC";
> +       compatible = "facebook,bletchley-bmc", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };
> +
> +       chosen {
> +               bootargs = "console=ttyS4,57600n8";
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x80000000>;
> +       };
> +
> +       iio-hwmon {
> +               compatible = "iio-hwmon";
> +               io-channels = <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +                       <&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +                       <&adc1 0>, <&adc1 1>, <&adc1 2>, <&adc1 3>,
> +                       <&adc1 4>, <&adc1 5>, <&adc1 6>, <&adc1 7>;
> +       };
> +
> +       spi_gpio: spi-gpio {
> +               status = "okay";

The okay is redundant.

> +               compatible = "spi-gpio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               gpio-sck = <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +               gpio-mosi = <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> +               gpio-miso = <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
> +               num-chipselects = <1>;
> +               cs-gpios = <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +
> +               tpmdev@0 {
> +                       compatible = "tcg,tpm_tis-spi";
> +                       spi-max-frequency = <33000000>;
> +                       reg = <0>;
> +               };
> +       };
> +
> +       switchphy: ethernet-phy@0 {
> +               // Fixed-link

Are there any properties we should be adding here? Other examples
mention the speed and duplex setting.

> +       };
> +

> +
> +&i2c0 {

> +
> +       sled0_fusb302: typec-portc@54 {
> +               compatible = "fcs,fusb302";
> +               reg = <0x22>;

Your reg property is 22, but the unit address is 54. These need to
math or you will get a warning from the device tree compiler:

arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:254.32-271.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@80/typec-portc@54: I2C bus unit address
format error, expected "22"

Please fix this for all the fusb302 nodes, and make sure you build
test with this patch applied to v5.16-rc1, or newer.

../arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:254.32-271.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@80/typec-portc@54: I2C bus unit address
format error, expected "22"
../arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:318.32-335.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@100/typec-portc@54: I2C bus unit address
format error, expected "22"
../arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:386.32-404.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@180/typec-portc@54: I2C bus unit address
format error, expected "22"
../arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:451.32-469.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@200/typec-portc@54: I2C bus unit address
format error, expected "22"
../arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:516.32-533.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@280/typec-portc@54: I2C bus unit address
format error, expected "22"
../arch/arm/boot/dts/aspeed-bmc-facebook-bletchley.dts:580.32-597.4:
Warning (i2c_bus_reg):
/ahb/apb/bus@1e78a000/i2c-bus@300/typec-portc@54: I2C bus unit address
format error, expected "22"


> +               interrupt-parent = <&gpio0>;
> +               interrupts = <ASPEED_GPIO(M, 0) IRQ_TYPE_LEVEL_LOW>;
> +
> +               connector {
> +                       compatible = "usb-c-connector";
> +                       label = "USB-C";
> +                       power-role = "dual";
> +                       try-power-role = "sink";
> +                       source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> +                       sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
> +                                       PDO_VAR(3000, 12000, 3000)
> +                                       PDO_PPS_APDO(3000, 11000, 3000)>;
> +                       op-sink-microwatt = <10000000>;
> +               };
> +       };
> +};
> +

Cheers,

Joel

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E672F445D6B
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 02:40:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HljrB5CJZz2yb6
	for <lists+linux-aspeed@lfdr.de>; Fri,  5 Nov 2021 12:40:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=OlHZHpMM;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f30;
 helo=mail-qv1-xf30.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=OlHZHpMM; dkim-atps=neutral
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hljr552zNz2xXW
 for <linux-aspeed@lists.ozlabs.org>; Fri,  5 Nov 2021 12:40:20 +1100 (AEDT)
Received: by mail-qv1-xf30.google.com with SMTP id u25so6523549qve.2
 for <linux-aspeed@lists.ozlabs.org>; Thu, 04 Nov 2021 18:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kuiu0Wf4u9BEGXBoIO9WIUY1RtGLPv3KstdNH+skVn4=;
 b=OlHZHpMMlHlA2mvNmNLMVYTBkYoOu+wuDTNv26+y/aJr0eHbC+oJ3i8677sqJTiFUB
 kZAqRUaI8Q6V6+kY6V4NK/At2bdGiTfcJOC9WS5kJ1FLTQiZNgKrHm0bU7MQi+LOFOTK
 UScPeAhF0wmBZeDCZ4h5BYhKBppp4cAGLcT3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kuiu0Wf4u9BEGXBoIO9WIUY1RtGLPv3KstdNH+skVn4=;
 b=WAd3SAOrtgJShMSzecznAiARQ5UzmApDTeyBBpJ3Zbb+wM/FHZMO6aVb47WMjfP1oX
 h/UqmSaOHT2X7GJraE1mVhUCC0GCeaOylrqsrDHXioH7T0/W1DOvPjIrQDwbI995UGow
 l3Qzpx7nZF00Wk12OGkIhTiGyy1N6TWOyARJBoL5zhYKAgugUSzPkOpYOG49kbz5JklK
 et9buBE18T5J3rq4KsG8+LfibM+luIM/78A3KdD4qve3R3j05AD8Ls4zX6y0VzeETV1N
 RJ0pFur0L0LgW0wJdB1ia1kDOjzN0ic+Trn5iSBxL//rNM6CyUGmw+LSDRkk5c6WkAu4
 GXHA==
X-Gm-Message-State: AOAM530md9rnfhlttmtKhpjCii0bmW4x8Sw0w+dRuGKjBHtjd1b3QD1j
 leXCwyxBkEDrUBYdU+oH1gGicICQrh/8iRxUut0=
X-Google-Smtp-Source: ABdhPJwn7ltINiaTnafuAfwJf+9xnaLsMQM755UKrybz+o6veGW29/K/cs79Ln231Xya3DTp+gpEIBBL8k1kZK/4deQ=
X-Received: by 2002:a0c:c784:: with SMTP id k4mr53964077qvj.43.1636076417159; 
 Thu, 04 Nov 2021 18:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <20211105005955.107419-1-osk@google.com>
In-Reply-To: <20211105005955.107419-1-osk@google.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 5 Nov 2021 01:40:05 +0000
Message-ID: <CACPK8XcXR=V5-Q+sC4MniNJZJgvbiysFD-5yu6v30_2BwDRTSA@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: tyan-s7106: Update nct7802 config
To: Oskar Senft <osk@google.com>
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
Cc: Rob Herring <robh+dt@kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 5 Nov 2021 at 01:00, Oskar Senft <osk@google.com> wrote:
>
> This change updates the configuration for the nct7802 hardware
> monitor to correctly configure its temperature sensors.
>
> Signed-off-by: Oskar Senft <osk@google.com>

I applied this and tried comple testing, and got this warning:

  DTC     arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:217.4-14: Warning
(reg_format): /ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@0:reg:
property has invalid length (4 bytes) (#address-cells == 2,
#size-cells == 1)
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:220.4-14: Warning
(reg_format): /ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@1:reg:
property has invalid length (4 bytes) (#address-cells == 2,
#size-cells == 1)
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:226.4-14: Warning
(reg_format): /ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@2:reg:
property has invalid length (4 bytes) (#address-cells == 2,
#size-cells == 1)
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:232.4-14: Warning
(reg_format): /ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@3:reg:
property has invalid length (4 bytes) (#address-cells == 2,
#size-cells == 1)
arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb: Warning (pci_device_reg):
Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb: Warning
(pci_device_bus_num): Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb: Warning (i2c_bus_reg):
Failed prerequisite 'reg_format'
arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dtb: Warning (spi_bus_reg):
Failed prerequisite 'reg_format'
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:216.13-218.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@0: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:216.13-218.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@0: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:219.13-223.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@1: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:219.13-223.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@1: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:225.13-229.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@2: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:225.13-229.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@2: Relying on
default #size-cells value
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:231.13-234.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@3: Relying on
default #address-cells value
../arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts:231.13-234.5: Warning
(avoid_default_addr_size):
/ahb/apb/bus@1e78a000/i2c-bus@40/nct7802@28/channel@3: Relying on
default #size-cells value

You need to add this to the nct node:

#address-cells = <1>;
#size-cells = <0>;

Did you see this with your testing? I'm building on top of v5.15 and
my distro's dtc is 1.6.0.

> ---
> Changes from PATCH v1:
> - Removed superfluous "status" from channels.
> ---
>  arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> index 68f332ee1886..66734e4e2ea1 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-tyan-s7106.dts
> @@ -213,6 +213,25 @@ &i2c0 {
>         nct7802@28 {
>                 compatible = "nuvoton,nct7802";
>                 reg = <0x28>;
> +               channel@0 { /* LTD */
> +                       reg = <0>;
> +               };
> +               channel@1 { /* RTD1 */
> +                       reg = <1>;
> +                       sensor-type = "temperature";
> +                       temperature-mode = "thermistor";
> +               };
> +
> +               channel@2 { /* RTD2 */
> +                       reg = <2>;
> +                       sensor-type = "temperature";
> +                       temperature-mode = "thermistor";
> +               };
> +
> +               channel@3 { /* RTD3 */
> +                       reg = <3>;
> +                       sensor-type = "temperature";
> +               };
>         };
>
>         /* Also connected to:
> --
> 2.34.0.rc0.344.g81b53c2807-goog
>

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECB214E7BE
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2020 04:57:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4883N00XFzzDqdG
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 Jan 2020 14:57:52 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=noyHcUPq; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4883Mt5rH8zDqcV
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 Jan 2020 14:57:46 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id y8so2655289qvk.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 Jan 2020 19:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OS9mBViSnpsx15jMubvsBFiHBkNyIzUT3w9rd7Dkm/4=;
 b=noyHcUPqJ0I5pWCEXCl8lIoSgyMPfW1Alr3FH8Icy2qTfIQG6tC7f5iR6GJJgBlvBH
 Zj7O6G0hnO+elulx3q0wMDv6N602q09EdFidsG+RazZIn6kKV15MIrMncnKEIg7BjvDf
 MGBpMYvNY0vc8PhsLTtRl7c4xih/i7Kz7jHZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OS9mBViSnpsx15jMubvsBFiHBkNyIzUT3w9rd7Dkm/4=;
 b=bBowDRCtiddq0nDm2JnhUI24r5keS9RpYVlomf7i6HskQy3IQjFzf8cU6gNYF9+yQX
 KsBgsMgWJa7EFfqaeWcrLKwSIi/whmuqYiZVXl2emDY8i/fN7iQLOzyVJhZM6nStL2Pz
 d7JtNea3VxEfkepK5UOBX5ReABNd4aMR7qRHrghGQPTQFIxjKqUS12L5Hg/BxOYnAcci
 x5xEiGM429tAykfwfj1G6WqwgELj1HtZ0RvRlsk9GWNprU/QnHk39RLJAK48lHIkRdV9
 HCH+E9U4wlfsCavkIIQTnQ9djTtPQu7Ahi3Qi+BH19YJ4vTsjCVwBCkwcN1sBTNv3/Vg
 v6tw==
X-Gm-Message-State: APjAAAUelmRWL50H4HEVgtXshKWYBJ7AVV15E04WlEqNor5gz5dauCu9
 1wI4sP7ai0Ziai4i5WCJELHLITJw8zzgIINcgHg=
X-Google-Smtp-Source: APXvYqwa+52T6lEl42UR4l4JCqYs01dXPTl8h5GnRqow8oHgCFNPqL4JOACxrc1HcV1odaRzFYIi256vZzydv0SSYWQ=
X-Received: by 2002:a0c:ead1:: with SMTP id y17mr8055946qvp.210.1580443062931; 
 Thu, 30 Jan 2020 19:57:42 -0800 (PST)
MIME-Version: 1.0
References: <20200128011817.4095682-1-vijaykhemka@fb.com>
In-Reply-To: <20200128011817.4095682-1-vijaykhemka@fb.com>
From: Joel Stanley <joel@jms.id.au>
Date: Fri, 31 Jan 2020 03:57:31 +0000
Message-ID: <CACPK8XfJYVH6EotMQcuuoV5hWnkA79oHSCvQBx5gr4np8Y59og@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: tiogapass: Add gpio line names
To: Vijay Khemka <vijaykhemka@fb.com>
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
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 28 Jan 2020 at 01:18, Vijay Khemka <vijaykhemka@fb.com> wrote:
>
> Added GPIO line names for all gpio used in tiogapass platform,
> these line names will be used by libgpiod to control GPIOs
>
> Signed-off-by: Vijay Khemka <vijaykhemka@fb.com>

The verbosity of the bindings is unfortunate, but I think it's the
only option we have to date.

Reviewed-by: Joel Stanley <joel@jms.id.au>

I will merge this through the aspeed tree for 5.7.

Cheers,

Joel

> ---
> v2 : Added BIOS_SPI_BMC_CTRL gpio line name
>
>  .../dts/aspeed-bmc-facebook-tiogapass.dts     | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> index 682f729ea25e..fb7f034d5db2 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-facebook-tiogapass.dts
> @@ -121,6 +121,69 @@
>         kcs_addr = <0xca2>;
>  };
>
> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "BMC_CPLD_FPGA_SEL","","","","","","","",
> +       /*B0-B7*/       "","BMC_DEBUG_EN","","","","BMC_PPIN","PS_PWROK",
> +                       "IRQ_PVDDQ_GHJ_VRHOT_LVT3",
> +       /*C0-C7*/       "","","","","","","","",
> +       /*D0-D7*/       "BIOS_MRC_DEBUG_MSG_DIS","BOARD_REV_ID0","",
> +                       "BOARD_REV_ID1","IRQ_DIMM_SAVE_LVT3","BOARD_REV_ID2",
> +                       "CPU_ERR0_LVT3_BMC","CPU_ERR1_LVT3_BMC",
> +       /*E0-E7*/       "RESET_BUTTON","RESET_OUT","POWER_BUTTON",
> +                       "POWER_OUT","NMI_BUTTON","","CPU0_PROCHOT_LVT3_ BMC",
> +                       "CPU1_PROCHOT_LVT3_ BMC",
> +       /*F0-F7*/       "IRQ_PVDDQ_ABC_VRHOT_LVT3","",
> +                       "IRQ_PVCCIN_CPU0_VRHOT_LVC3",
> +                       "IRQ_PVCCIN_CPU1_VRHOT_LVC3",
> +                       "IRQ_PVDDQ_KLM_VRHOT_LVT3","","P3VBAT_BRIDGE_EN","",
> +       /*G0-G7*/       "CPU_ERR2_LVT3","CPU_CATERR_LVT3","PCH_BMC_THERMTRIP",
> +                       "CPU0_SKTOCC_LVT3","","","","BIOS_SMI_ACTIVE",
> +       /*H0-H7*/       "LED_POST_CODE_0","LED_POST_CODE_1","LED_POST_CODE_2",
> +                       "LED_POST_CODE_3","LED_POST_CODE_4","LED_POST_CODE_5",
> +                       "LED_POST_CODE_6","LED_POST_CODE_7",
> +       /*I0-I7*/       "CPU0_FIVR_FAULT_LVT3","CPU1_FIVR_FAULT_LVT3",
> +                       "FORCE_ADR","UV_ADR_TRIGGER_EN","","","","",
> +       /*J0-J7*/       "","","","","","","","",
> +       /*K0-K7*/       "","","","","","","","",
> +       /*L0-L7*/       "IRQ_UV_DETECT","IRQ_OC_DETECT","HSC_TIMER_EXP","",
> +                       "MEM_THERM_EVENT_PCH","PMBUS_ALERT_BUF_EN","","",
> +       /*M0-M7*/       "CPU0_RC_ERROR","CPU1_RC_ERROR","","OC_DETECT_EN",
> +                       "CPU0_THERMTRIP_LATCH_LVT3",
> +                       "CPU1_THERMTRIP_LATCH_LVT3","","",
> +       /*N0-N7*/       "","","","CPU_MSMI_LVT3","","BIOS_SPI_BMC_CTRL","","",
> +       /*O0-O7*/       "","","","","","","","",
> +       /*P0-P7*/       "BOARD_SKU_ID0","BOARD_SKU_ID1","BOARD_SKU_ID2",
> +                       "BOARD_SKU_ID3","BOARD_SKU_ID4","BMC_PREQ",
> +                       "BMC_PWR_DEBUG","RST_RSMRST",
> +       /*Q0-Q7*/       "","","","","UARTSW_LSB","UARTSW_MSB",
> +                       "POST_CARD_PRES_BMC","PE_BMC_WAKE",
> +       /*R0-R7*/       "","","BMC_TCK_MUX_SEL","BMC_PRDY",
> +                       "BMC_XDP_PRSNT_IN","RST_BMC_PLTRST_BUF","SLT_CFG0",
> +                       "SLT_CFG1",
> +       /*S0-S7*/       "THROTTLE","BMC_READY","","HSC_SMBUS_SWITCH_EN","",
> +                       "","","",
> +       /*T0-T7*/       "","","","","","","","",
> +       /*U0-U7*/       "","","","","","BMC_FAULT","","",
> +       /*V0-V7*/       "","","","FAST_PROCHOT_EN","","","","",
> +       /*W0-W7*/       "","","","","","","","",
> +       /*X0-X7*/       "","","","GLOBAL_RST_WARN",
> +                       "CPU0_MEMABC_MEMHOT_LVT3_BMC",
> +                       "CPU0_MEMDEF_MEMHOT_LVT3_BMC",
> +                       "CPU1_MEMGHJ_MEMHOT_LVT3_BMC",
> +                       "CPU1_MEMKLM_MEMHOT_LVT3_BMC",
> +       /*Y0-Y7*/       "SIO_S3","SIO_S5","BMC_JTAG_SEL","SIO_ONCONTROL","",
> +                       "","","",
> +       /*Z0-Z7*/       "","SIO_POWER_GOOD","IRQ_PVDDQ_DEF_VRHOT_LVT3","",
> +                       "","","","",
> +       /*AA0-AA7*/     "CPU1_SKTOCC_LVT3","IRQ_SML1_PMBUS_ALERT",
> +                       "SERVER_POWER_LED","","PECI_MUX_SELECT","UV_HIGH_SET",
> +                       "","POST_COMPLETE",
> +       /*AB0-AB7*/     "IRQ_HSC_FAULT","OCP_MEZZA_PRES","","","","","","",
> +       /*AC0-AC7*/     "","","","","","","","";
> +};
> +
>  &mac0 {
>         status = "okay";
>
> --
> 2.17.1
>

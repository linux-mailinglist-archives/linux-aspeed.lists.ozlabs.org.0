Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B9F2AFBB1
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Nov 2020 00:31:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWgwQ67V5zDqc2
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Nov 2020 10:31:18 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72b;
 helo=mail-qk1-x72b.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=D1JWYbNj; dkim-atps=neutral
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWgs1547KzDqwD
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Nov 2020 10:28:21 +1100 (AEDT)
Received: by mail-qk1-x72b.google.com with SMTP id v143so3667498qkb.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 11 Nov 2020 15:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E/pzSG/qY4kmN8qTffKOlLUErabhAzy6PW1pTMcSYxQ=;
 b=D1JWYbNjDgUOzZSIPZ8BN2CZsCIlgGjdqv7XrZYfFcWgDtKRKeTrhWWr6r31Uu//JA
 25VTHgRHj8XX+GB4JAJM2jtsR8ALyBMMZJP0osnrDCjjHzz8mTjRL6JLvGKJ3F1QuYZ7
 ebVBcCinXn8VTW/6R2XRzRGsU5gkUOevBT+RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E/pzSG/qY4kmN8qTffKOlLUErabhAzy6PW1pTMcSYxQ=;
 b=B8Qiqpmxcjmpucrev/feIyt8Cq44v0qlOz5pVO1OcLcn9f685Y/Od6S6f1ygXu2rsx
 eYKEVMmIr/ql5xV2AV17iZJ0mraQsffEQ9hEIKAqPcgbz8HW/NBHyGExQWDdq+ixy4ED
 UPq9PJZhdLZ51n5+seHrvXIwhN4gSTBVhZnAFMRPHOb8af7QXv/Lndomd+JlcuecpLqM
 CRzbPGjGZZLwE+W+8KA2VlHCCuuVPyD0DoaY/qMAudp3Xr+Si4oH63HJzjbwLSgexua9
 pOdwQwe6K2SNCZX7mk35gDitLZRerSJKHUGw4R6ycUn33ohdetoHx1S02mJPII3SDFSO
 ETPQ==
X-Gm-Message-State: AOAM530THBADvtQOD0x8dszDOurJki2uxnTJr751ZTsxfMy97sMMTVif
 dtzz9YEejbTDD48REouu1v5o1QfnfO0psMcYhw4=
X-Google-Smtp-Source: ABdhPJyB+NvaUkOEgaloFMbC0GaxJHVeM1PcZvrlT6egRNPlwOrz0Tsa5BDYQDj1cLr7Y4YR91wqBJDgwazu8lLapj8=
X-Received: by 2002:ae9:e90d:: with SMTP id x13mr28158378qkf.66.1605137297631; 
 Wed, 11 Nov 2020 15:28:17 -0800 (PST)
MIME-Version: 1.0
References: <20201111132133.1253-1-aladyshev22@gmail.com>
 <1a223f4d-8654-89e9-3b39-97e4b1128700@amd.com>
In-Reply-To: <1a223f4d-8654-89e9-3b39-97e4b1128700@amd.com>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 11 Nov 2020 23:28:02 +0000
Message-ID: <CACPK8Xehikj3ztsez-X-54MhacLKB-1xCnExWt49ELYfjTzecQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: amd-ethanolx: Add GPIO line names
To: Supreeth Venkatesh <supreeth.venkatesh@amd.com>
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Konstantin Aladyshev <aladyshev22@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 11 Nov 2020 at 22:44, Supreeth Venkatesh
<supreeth.venkatesh@amd.com> wrote:
>
>
>
> On 11/11/20 7:21 AM, Konstantin Aladyshev wrote:
> > [CAUTION: External Email]
> >
> > Add GPIO line names for AMD EthanolX customer reference board.
> > It populates AST2500 GPIO lines (A0-A7 to AC0-AC7) with AMD EthanolX
> > designated names.
> >
> > Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> Reviewed-by: Supreeth Venkatesh <supreeth.venkatesh@amd.com>

Applied to dt-for-v5.11.

Thanks,

Joel

> > ---
> >  arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts | 44 +++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> > index b93ed44eba0c..96ff0aea64e5 100644
> > --- a/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> > +++ b/arch/arm/boot/dts/aspeed-bmc-amd-ethanolx.dts
> > @@ -97,6 +97,50 @@
> >                      &pinctrl_adc4_default>;
> >  };
> >
> > +&gpio {
> > +       status = "okay";
> > +       gpio-line-names =
> > +       /*A0-A7*/       "","","FAULT_LED","CHASSIS_ID_LED","","","","",
> > +       /*B0-B7*/       "","","","","","","","",
> > +       /*C0-C7*/       "CHASSIS_ID_BTN","INTRUDER","AC_LOSS","","","","","",
> > +       /*D0-D7*/       "HDT_DBREQ","LOCAL_SPI_ROM_SEL","FPGA_SPI_ROM_SEL","JTAG_MUX_S",
> > +                       "JTAG_MUX_OE","HDT_SEL","ASERT_WARM_RST_BTN","FPGA_RSVD",
> > +       /*E0-E7*/       "","","MON_P0_PWR_BTN","MON_P0_RST_BTN","MON_P0_NMI_BTN",
> > +                       "MON_P0_PWR_GOOD","MON_PWROK","MON_RESET",
> > +       /*F0-F7*/       "MON_P0_PROCHOT","MON_P1_PROCHOT","MON_P0_THERMTRIP",
> > +                       "MON_P1_THERMTRIP","P0_PRESENT","P1_PRESENT","MON_ATX_PWR_OK","",
> > +       /*G0-G7*/       "BRD_REV_ID_3","BRD_REV_ID_2","BRD_REV_ID_1","BRD_REV_ID_0",
> > +                       "P0_APML_ALERT","P1_APML_ALERT","FPGA ALERT","",
> > +       /*H0-H7*/       "BRD_ID_0","BRD_ID_1","BRD_ID_2","BRD_ID_3",
> > +                       "PCIE_DISCONNECTED","USB_DISCONNECTED","SPARE_0","SPARE_1",
> > +       /*I0-I7*/       "","","","","","","","",
> > +       /*J0-J7*/       "","","","","","","","",
> > +       /*K0-K7*/       "","","","","","","","",
> > +       /*L0-L7*/       "","","","","","","","",
> > +       /*M0-M7*/       "ASSERT_PWR_BTN","ASSERT_RST_BTN","ASSERT_NMI_BTN",
> > +                       "ASSERT_LOCAL_LOCK","ASSERT_P0_PROCHOT","ASSERT_P1_PROCHOT",
> > +                       "ASSERT_CLR_CMOS","ASSERT_BMC_READY",
> > +       /*N0-N7*/       "","","","","","","","",
> > +       /*O0-O7*/       "","","","","","","","",
> > +       /*P0-P7*/       "P0_VDD_CORE_RUN_VRHOT","P0_VDD_SOC_RUN_VRHOT",
> > +                       "P0_VDD_MEM_ABCD_SUS_VRHOT","P0_VDD_MEM_EFGH_SUS_VRHOT",
> > +                       "P1_VDD_CORE_RUN_VRHOT","P1_VDD_SOC_RUN_VRHOT",
> > +                       "P1_VDD_MEM_ABCD_SUS_VRHOT","P1_VDD_MEM_EFGH_SUS_VRHOT",
> > +       /*Q0-Q7*/       "","","","","","","","",
> > +       /*R0-R7*/       "","","","","","","","",
> > +       /*S0-S7*/       "","","","","","","","",
> > +       /*T0-T7*/       "","","","","","","","",
> > +       /*U0-U7*/       "","","","","","","","",
> > +       /*V0-V7*/       "","","","","","","","",
> > +       /*W0-W7*/       "","","","","","","","",
> > +       /*X0-X7*/       "","","","","","","","",
> > +       /*Y0-Y7*/       "","","","","","","","",
> > +       /*Z0-Z7*/       "","","","","","","","",
> > +       /*AA0-AA7*/     "","SENSOR THERM","","","","","","",
> > +       /*AB0-AB7*/     "","","","","","","","",
> > +       /*AC0-AC7*/     "","","","","","","","";
> > +};
> > +
> >  //APML for P0
> >  &i2c0 {
> >         status = "okay";
> > --
> > 2.17.1
> >

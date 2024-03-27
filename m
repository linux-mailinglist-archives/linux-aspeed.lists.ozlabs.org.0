Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1506688EA93
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Mar 2024 17:08:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NjvtWE4C;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4WmP4txRz3vXx
	for <lists+linux-aspeed@lfdr.de>; Thu, 28 Mar 2024 03:08:05 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NjvtWE4C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com; envelope-from=peteryin.openbmc@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4WmF1pHSz3vXM
	for <linux-aspeed@lists.ozlabs.org>; Thu, 28 Mar 2024 03:07:55 +1100 (AEDT)
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-41488f9708fso23825475e9.3
        for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Mar 2024 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711555668; x=1712160468; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1aoTSdMd/YSVHtvQI+80zrqseLyOiRVNHBsZL+C3hws=;
        b=NjvtWE4CbT428KCYVu4hJViiOBHgID8GnNfCbQ/bIJtTuxtOi7t/m6ufu/DfSwXeza
         Gk2EEIL1wLdi7/KgXcZVpnCIR6fbb1ZkdoaEm5YZMo/LUc9Jn2reR14oHgn/Y1uX0Q0p
         3CRMphbOCTIsb3QZPzs51TBHeMMXsKK4mSkdF8e+AHp9raJk7LpRCquCHA3qrojKune1
         Y29nzlCJonPNRh/1wqt89Q5hpzCqzvf90j828RKyI1FAMFAN1d5LXv1iKegD3nY932Vv
         3CH4mhN/LF33kTAbeg4kF9Y++9pd5jgOnPm4+uUF6LX5E2FOhLafa24Mi/HTg8RBWyL2
         B7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711555668; x=1712160468;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1aoTSdMd/YSVHtvQI+80zrqseLyOiRVNHBsZL+C3hws=;
        b=b9ThRN/aZInLrQdK8W40ML6OG2o5alQCLYBQuylxX4e0umYBdWhq7hfiz8CnrXGfhi
         PTZbMf6ud9vBFHQPgW5Aaby1wKv0yRacoMtexsh8tEVdBgsdmJT63jSQFUnuUvCJjrm9
         wTvAKXdA42eOESSqBq07E2xIsqNgZlcWcEAAOZJ8J34SXhMQfPPX6D9yptIY74Dl0VX0
         5sm0JF1EE+mxnnQ4VUENFGC/90DCP15i5ZzLNQ1HTo4GGym7Pu432QmlJ74HhEUtUITr
         QVYxMPIW22K4ljwhYYLMR05di/suX6UQ83DAk3XBj9ALd68NCxzbITNEmWLAS5iyiWYC
         z0OA==
X-Forwarded-Encrypted: i=1; AJvYcCU7MF5rlAqy2+Ifcc2KUpwzOUx2CvsexhELUeHW67yxXnrRoxp3kK9stA/hteXibgOFjI/t1NG6hLC/yshJfM5c8kmt6bNE9lHKWXpfVw==
X-Gm-Message-State: AOJu0YyuyhyjBWQZK4F5xDzLOebA+RKPvy/Tr5QxgsCGjealkzAnYbJE
	LrpYbWTHBDeu3icw/wtc/jQph6xFu/8Hr/DcBdDMcWuRQYrDT1tazhoBtGfmQidJZkFrCWVCBWi
	8uiYxf8lA+5Ie294PeZ7sT5dFniE=
X-Google-Smtp-Source: AGHT+IH7/Jqj90OxYt8pWZTIjiz20FfICzxEflsOFI82rOwXB5yBQWTi+VkGbyeoop7QhohLovTBy7V1DlPYZuwJH3E=
X-Received: by 2002:a05:600c:1c01:b0:413:ff06:83cd with SMTP id
 j1-20020a05600c1c0100b00413ff0683cdmr344618wms.3.1711555668321; Wed, 27 Mar
 2024 09:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240327085330.3281697-1-peteryin.openbmc@gmail.com>
 <20240327085330.3281697-5-peteryin.openbmc@gmail.com> <f0b03c0b-eb54-420e-a4f7-8286e20b9df6@roeck-us.net>
In-Reply-To: <f0b03c0b-eb54-420e-a4f7-8286e20b9df6@roeck-us.net>
From: Chia Hsing Yin <peteryin.openbmc@gmail.com>
Date: Thu, 28 Mar 2024 00:07:37 +0800
Message-ID: <CAPSyxFQ8Dpks6c17XpF-fw9ppgoKfYfvYADvqVw2PYHNFptWTQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] drivers: watchdog: ast2500 and ast2600 support bootstatus
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Andrew Jeffery <andrew@codeconstruct.com.au>, linux-watchdog@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, patrick@stwcx.xyz, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 11:47=E2=80=AFPM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 3/27/24 01:53, Peter Yin wrote:
> > Add WDIOF_EXTERN1 and WDIOF_CARDRESET bootstatus in ast2600
> >
> > Regarding the AST2600 specification, the WDTn Timeout Status Register
> > (WDT10) has bit 1 reserved. Bit 1 of the status register indicates
> > on ast2500 if the boot was from the second boot source.
> > It does not indicate that the most recent reset was triggered by
> > the watchdog. The code should just be changed to set WDIOF_CARDRESET
> > if bit 0 of the status register is set.
> >
> > Include SCU register to veriy WDIOF_EXTERN1 in ast2600 SCU74 or
> > ast2500 SCU3C when bit1 is set.
> >
> > Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
> > ---
> >   drivers/watchdog/aspeed_wdt.c | 60 +++++++++++++++++++++++++---------=
-
> >   1 file changed, 44 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/watchdog/aspeed_wdt.c b/drivers/watchdog/aspeed_wd=
t.c
> > index b4773a6aaf8c..29e9afdee619 100644
> > --- a/drivers/watchdog/aspeed_wdt.c
> > +++ b/drivers/watchdog/aspeed_wdt.c
> > @@ -11,10 +11,12 @@
> >   #include <linux/io.h>
> >   #include <linux/kernel.h>
> >   #include <linux/kstrtox.h>
> > +#include <linux/mfd/syscon.h>
> >   #include <linux/module.h>
> >   #include <linux/of.h>
> >   #include <linux/of_irq.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> >   #include <linux/watchdog.h>
> >
> >   static bool nowayout =3D WATCHDOG_NOWAYOUT;
> > @@ -65,23 +67,32 @@ MODULE_DEVICE_TABLE(of, aspeed_wdt_of_table);
> >   #define WDT_RELOAD_VALUE    0x04
> >   #define WDT_RESTART         0x08
> >   #define WDT_CTRL            0x0C
> > -#define   WDT_CTRL_BOOT_SECONDARY    BIT(7)
> > -#define   WDT_CTRL_RESET_MODE_SOC    (0x00 << 5)
> > -#define   WDT_CTRL_RESET_MODE_FULL_CHIP      (0x01 << 5)
> > -#define   WDT_CTRL_RESET_MODE_ARM_CPU        (0x10 << 5)
> > -#define   WDT_CTRL_1MHZ_CLK          BIT(4)
> > -#define   WDT_CTRL_WDT_EXT           BIT(3)
> > -#define   WDT_CTRL_WDT_INTR          BIT(2)
> > -#define   WDT_CTRL_RESET_SYSTEM              BIT(1)
> > -#define   WDT_CTRL_ENABLE            BIT(0)
> > +#define WDT_CTRL_BOOT_SECONDARY      BIT(7)
> > +#define WDT_CTRL_RESET_MODE_SOC      (0x00 << 5)
> > +#define WDT_CTRL_RESET_MODE_FULL_CHIP        (0x01 << 5)
> > +#define WDT_CTRL_RESET_MODE_ARM_CPU  (0x10 << 5)
> > +#define WDT_CTRL_1MHZ_CLK            BIT(4)
> > +#define WDT_CTRL_WDT_EXT             BIT(3)
> > +#define WDT_CTRL_WDT_INTR            BIT(2)
> > +#define WDT_CTRL_RESET_SYSTEM                BIT(1)
> > +#define WDT_CTRL_ENABLE              BIT(0)
> >   #define WDT_TIMEOUT_STATUS  0x10
> > -#define   WDT_TIMEOUT_STATUS_IRQ             BIT(2)
> > -#define   WDT_TIMEOUT_STATUS_BOOT_SECONDARY  BIT(1)
> > +#define WDT_TIMEOUT_STATUS_IRQ               BIT(2)
> > +#define WDT_TIMEOUT_STATUS_BOOT_SECONDARY    BIT(1)
> > +#define WDT_TIMEOUT_STATUS_EVENT             BIT(0)
> >   #define WDT_CLEAR_TIMEOUT_STATUS    0x14
> > -#define   WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION  BIT(0)
> > +#define WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION    BIT(0)
> >   #define WDT_RESET_MASK1             0x1c
> >   #define WDT_RESET_MASK2             0x20
> >
>
> The above bit value defines were indented to show what is
> registers and what is register bit values. Why are you
> changing that other than for personal preference ?
>
> Guenter
>
Oh! I'm sorry, I didn't realize this was a rule. I thought it was just
an alignment issue. I will revert it in the next version. Thank you
for explaining.

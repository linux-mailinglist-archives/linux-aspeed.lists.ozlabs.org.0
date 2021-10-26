Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0469C43BBFE
	for <lists+linux-aspeed@lfdr.de>; Tue, 26 Oct 2021 23:03:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hf4736CL4z2yR8
	for <lists+linux-aspeed@lfdr.de>; Wed, 27 Oct 2021 08:03:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=L0Q6Q39K;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=L0Q6Q39K; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hf46y5L5Rz2xXJ
 for <linux-aspeed@lists.ozlabs.org>; Wed, 27 Oct 2021 08:03:37 +1100 (AEDT)
Received: by mail-qv1-xf2c.google.com with SMTP id u25so404872qve.2
 for <linux-aspeed@lists.ozlabs.org>; Tue, 26 Oct 2021 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XG5lbTjVQqOyn0s7cG0no6APYPSE1g9UuIJyOQ6ldbQ=;
 b=L0Q6Q39KF4ld5D0VLg4Foh6S7OmTuL4NUJHDlWVu8adgjXhgE4sPJgxkeNiiYrl8H5
 KprWsqQ8R8PY9IgEbm6QTvlQwatPzn6ZFHRV2claSzj4DnHUp5pIjWH8guAKZqsTVv9d
 UtXb4AQ8yTRsTAkMdaq0hFNvQubso2XBdKzvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XG5lbTjVQqOyn0s7cG0no6APYPSE1g9UuIJyOQ6ldbQ=;
 b=WWZ/lB1QPMgUmM82GPPE7N9bi7psifocE+/nijYWDsHApEFWIj1upDAYvduVaHiAc0
 2G4j5TlRnL4BpaKRgeeLgq7eWwIMnEGxr49A7D3d/m/M1hosCBxIycHGBUgCYZrLANhg
 gxe/s5lbK5HvcTj9zmT0c3k6I+a1VZtJrJIbeFNsPJJRN5OHOsNdMTgYAstccS2MWV55
 WFoh72ZELa/uHAGfuqOdJClX9WihiPhC6GCBOf/fpwPOJcDq4hbnz5F5eXfvKmWUCLFG
 Ap4464etejlR6mgZdhhpR2feDrAMW/LdgVeWwrS8USKby9CffQyaraEeEtAbTISzbdT6
 evBg==
X-Gm-Message-State: AOAM533Spl73CudkzOU3t2yOkEfY3QFunK2fpKv8fhhiVSo+NzrlsPnQ
 KiO9b48hGYx8rJyALs6MT32Bh0a6bmYivyfI4iA=
X-Google-Smtp-Source: ABdhPJyS+raPQ3RHzlakqcRijKe8IBgxi3FsZs0B+JL2VJIAV2O/RysAVQOh6SdhYJC6+oczNxVjX85+/VudRV6YotQ=
X-Received: by 2002:a0c:cdcd:: with SMTP id a13mr19072201qvn.27.1635282214282; 
 Tue, 26 Oct 2021 14:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211026200058.2183-1-aladyshev22@gmail.com>
In-Reply-To: <20211026200058.2183-1-aladyshev22@gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 26 Oct 2021 21:03:22 +0000
Message-ID: <CACPK8Xd5eYpsFNw1jEjv3NaShgzE3zC_Ct29pJM34TfrqRTNtQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add AMD DaytonaX BMC
To: Konstantin Aladyshev <aladyshev22@gmail.com>
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
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Supreeth Venkatesh <supreeth.venkatesh@amd.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Hello Konstantin,

On Tue, 26 Oct 2021 at 20:01, Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> Add initial version of device tree for the BMC in the AMD DaytonaX
> platform.
>
> AMD DaytonaX platform is a customer reference board (CRB) with an
> Aspeed ast2500 BMC manufactured by AMD.
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>

This looks good. I have one comment about the GPIOs below.

> +&gpio {
> +       status = "okay";
> +       gpio-line-names =
> +       /*A0-A7*/       "","","FAULT_LED","","","","","",
> +       /*B0-B7*/       "","","","","","","","",
> +       /*C0-C7*/       "CHASSIS_ID_BTN","","","","","","","",
> +       /*D0-D7*/       "","","ASSERT_BMC_READY","","","","","",
> +       /*E0-E7*/       "MON_P0_RST_BTN","ASSERT_RST_BTN","MON_P0_PWR_BTN","ASSERT_PWR_BTN","",
> +                       "MON_P0_PWR_GOOD","MON_PWROK","",

For systems that will run openbmc, we try to use naming conventions
from this document:

https://github.com/openbmc/docs/blob/master/designs/device-tree-gpio-naming.md

If a GPIO is missing from that doc I encourage you to add it.

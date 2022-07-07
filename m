Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8269E56A408
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Jul 2022 15:47:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdyQB3TFnz3c3v
	for <lists+linux-aspeed@lfdr.de>; Thu,  7 Jul 2022 23:47:14 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.17.13; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 464 seconds by postgrey-1.36 at boromir; Thu, 07 Jul 2022 23:47:07 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdyQ357Ckz3bt4
	for <linux-aspeed@lists.ozlabs.org>; Thu,  7 Jul 2022 23:47:06 +1000 (AEST)
Received: from mail-yb1-f170.google.com ([209.85.219.170]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MNLVU-1nxr2j2QSw-00OrJL; Thu, 07 Jul 2022 15:34:07 +0200
Received: by mail-yb1-f170.google.com with SMTP id f73so1707578yba.10;
        Thu, 07 Jul 2022 06:34:06 -0700 (PDT)
X-Gm-Message-State: AJIora97oLtu+BhODQUmSXQJllIWPh7xtVBLGxdT9z1jK0RmeDUpkhff
	Hmpw/wcwQF3ChFtYJYtg9johJrQ2Zs6DrOeS2cA=
X-Google-Smtp-Source: AGRyM1uVpCRoROO6rAh+vA5ak8N4SGshcVRH0JW9GvyB4UqceUAu6tZ1eCC16Bwe+GMTjR8QSqM1egSeZk3ZR5FMhlQ=
X-Received: by 2002:a25:7c41:0:b0:66d:766a:4815 with SMTP id
 x62-20020a257c41000000b0066d766a4815mr46624953ybc.480.1657200845543; Thu, 07
 Jul 2022 06:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
In-Reply-To: <20220707132054.GA10610@logan-ThinkPad-T14-Gen-1>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 7 Jul 2022 15:33:48 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
Message-ID: <CAK8P3a0P2u+LdXcU7As=dfNbg_J2eWfhgB9TT1-xVyH0v6OM5Q@mail.gmail.com>
Subject: Re: [PATCH v3] The Yosemite V3.5 is a facebook multi-node server
 platform that host four OCP server. The BMC in the Yosemite V3.5 platform
 based on AST2600 SoC.
To: Logananth Sundararaj <logananth13.hcl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:v3XaDAoBenKL3EZ585ieMupm1QG6Ixd5rPluq2JIsrgCul1vblt
 rn0AGjKhGz6G5vWie3MPmDTUmtB/0fFyyqQvBnPBHLQu3pd9QaZP+O2zEhAWotbDiouRuIm
 16DQBdW0GnX/t4PyXgaC47fyO8mUWe6Kqfe9jjG5wPW1lbcZkKj1W6ZY9NAdn127FO/jqB4
 vvxdrXNwxFip6+bMmkm2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:3LHSipNNr90=:k9n/vb4rYQ1/hwNQ2GmO+5
 VpEKMutp/wfJlTQ0glZ+odZySYKtVRBT+hPcyYqSON/sOwRLjGTUUwYtXtyH3ImANvdJlLo1j
 5XsSbnnBHT8f13cVEmrzBDZujYpIyneqjowpJCqcttbJa38+xz2M/7zRkhkZqqDOEA8NqYI6h
 VKBZtH4ES1q+I7lsukntetJUgJLFLWLg6OzFNiIq1uFMFpzBHBOoRXYYo1vOS3i/nAGLYH1TZ
 wSA5OPXPee1PEPNK/O1lowIWqVWjTvhuiGKLZWmpFhv72hO5dwq+jvU7ihuNehIDHOOVQvYRV
 pNvnpAHsvJMieWLNy0h7ArIo4f0f7zy6QZ0bOtUUYEn9FS0DkpLVUxiV//qSnt5jUK2gNapgu
 7pbUY7xR//8p3TBPv9lIEegxrDWmRs3N+LAanuNV70VRs78pbJKktOW6MhXt48GIf2ZSi5Jhk
 LSg0+UntB5wr81mBfqTqsmXmfTWARe2q7iraLuA5IpiKs9t0eZNJir95iXpz5Cu/vKf11xQaU
 sRzh7RRwWjzUEuJk7BbWYM4/p/+ZSkpaIDzRcfGm9kKbp1OhKDQ+LwBUCpOWJdvKiIXsdqTuL
 SDELNVmWEqWNlWNNvMlyora0AVD2EpbIcOFIMdxz2qOMHqlhmr3djEiLENKX8V3Ruzpz7dcZ9
 U0VytypU8z6+7P2sJVFkOgscXZD4fqjY8LPmRYiW7vlkAKm6FcKYGqd02FQouN4QkXf7rFLAG
 hPsZFoQLkFL3gbsVw3xTTc3FcMKuJqSCFR4UW+6X5sjF01mXLmq5WaujEi9CGR8CBC8VKAqqz
 YQoOVYGZ59MKfFF6lOecnSOHSQMhKgAehoeff7v1Ny2/dqBZbL0yFGOSVOb5Lg2ujQsnO2IVq
 Pkr9Ff8r5N2jPrPHPB/U9EEn0rdNu/25e162hO3io=
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
Cc: DTML <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>, OpenBMC Maillist <openbmc@lists.ozlabs.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, naveen.mosess@hcl.com, thangavel.k@hcl.com, patrick@stwcx.xyz, SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, garnermic@gmail.com, velumanit@hcl.com, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Jul 7, 2022 at 3:20 PM Logananth Sundararaj
<logananth13.hcl@gmail.com> wrote:
>
> This patch adds linux device tree entry related to
> Yosemite V3.5 specific devices connected to BMC SoC.
>
> Signed-off-by: Logananth Sundararaj <logananth_s@hcl.com>


Something went wrong with the patch description, it looks like you dropped
the subject and sent the first paragraph as the subject instead.

> +/ {
> +       model = "Facebook fby35";
> +       compatible = "facebook,fby35", "aspeed,ast2600";
> +
> +       aliases {
> +               serial4 = &uart5;
> +       };

Why not start at serial0 here?

> +       chosen {
> +               stdout-path = &uart5;
> +               bootargs = "console=ttyS4,57600n8 root=/dev/ram rw vmalloc=384M";
> +       };

The bootargs should really come from the boot loader.

Why do you need the vmalloc=384M? That seems excessive.

> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x80000000 0x80000000>;
> +       };

The memory location and size is usually also set by the boot loader

        Arnd

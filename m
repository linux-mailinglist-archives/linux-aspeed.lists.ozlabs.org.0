Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD4A4D4221
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 09:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDhQB2h9xz307C
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Mar 2022 19:03:14 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.134; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDhQ55wkpz2xBl
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 19:03:08 +1100 (AEDT)
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MhlCa-1o5fB048y8-00djeT for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar
 2022 09:03:03 +0100
Received: by mail-wr1-f41.google.com with SMTP id t11so6609917wrm.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Mar 2022 00:03:02 -0800 (PST)
X-Gm-Message-State: AOAM530iCS4+iY8wTUCwiDS43t2S1Xp5BMcJeB3YN3lpexbK/4lz+L9e
 /gsnqYLf9K7ScV+Sdj76LLvp+ROzC19vTwBQ86M=
X-Google-Smtp-Source: ABdhPJzx4aGqsaQueZTueU2Zr+1DzoEbAMS1PYqMm01/aHYLONbfnac+2vYhtqtOVsbfKBFWx94jBYCzqwimnQbgaKU=
X-Received: by 2002:adf:f606:0:b0:203:8dff:f4ac with SMTP id
 t6-20020adff606000000b002038dfff4acmr427551wrp.12.1646899382039; Thu, 10 Mar
 2022 00:03:02 -0800 (PST)
MIME-Version: 1.0
References: <20220310000629.119699-1-joel@jms.id.au>
 <20220310000629.119699-3-joel@jms.id.au>
In-Reply-To: <20220310000629.119699-3-joel@jms.id.au>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 10 Mar 2022 09:02:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0LKG25Zu1X0m0FmSXpbC6YmWcvyhW1MOcw4XgnazS4sw@mail.gmail.com>
Message-ID: <CAK8P3a0LKG25Zu1X0m0FmSXpbC6YmWcvyhW1MOcw4XgnazS4sw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: soc: aspeed: Add secure boot controller
 support
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:EDcrqQdUnEakiDpURnqwVHzXyRnltasEuu4YYxQ5OPC4diaY+fP
 1NcVUY6/i7yYKEak/WmtnpO/qSXw2NnpiLWM/GF7HkkyFOG/VWx6WuHW8Rh3reCivMKUe2d
 IYklemeRYubce+csJJrG9UbR8aVCUXMHj/ggLPdB8rLYg6KPHYSNDRpwwWEJdd5VNCd9rdZ
 s+kM6UQd/r/OX3EnKxZbQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bNTAE9r6+Yw=:svi7kXxwCrL887cHn+1VYI
 109eZncPbphXNuFgilE0yV0JwL3F194PrJ9sWCFKz12BpVjREOYuHrNurkkBdToCNNhdFm8us
 leMjKDLTeWjEh5NwXWjLcY0EYvDdRzLkc7Ihbw6L7dOdxzJYYqRHaKqwCZL9zmyzKkN+dY3Yc
 8xxq2NCbo7Iy3CGD+TPDE2xi898HnJvpcQfSGgxoeuxWS6XUM+soHJ6Zt/1ubLUCiJIyWbnvL
 sVoo0GHhNsvqjzgvGJC3gd0fm1qgW6qewULYAwn9o33uuSzKyu4YtYwtEYZ8O3cFenn3fy4GO
 L3vy2MLb872uQ/32XLhL5R/k0WzpbcBlNNWqnZplCzOj1U0QmpblGsS5s7qvyjTIoYhvx1ZiR
 TJ62Kxnej7Fa5duE1koS2kZJ+IdDYj9YdOsrFwjFAPGTOW6qF3DZngHh2l9+NIF1TnUe0QB4u
 KYy029mBkKoN7aJKSionJuqop2dI+pQ6SDn4qixJ+rXNqQi2yjDmYqNC+w70K3r/8XjGmPPc1
 KsoyUYrMuSjBJdI3p9S22FD404FvCrMGGYuSdnZfdL3rthal+CZfHWN+K6FVlCkE4a2FRtYi+
 dKFcI/eMtNqzWOr4mMEWRztbfnl4xKhl7kf2g2Xyc3D26YMhYoZ5wmTTT3Wvu6xIPIbN3o9dr
 sbvFSvhcs8PTfm8dMwPpEl73y4fSCGq+y8nxXLpetfLxgyOaHGlhOBNipri/38JvxVica6Mpz
 UB2+tmtZHTiGIP5+RfL2a6dYhLZJe/gl7OuWxHLGkv4GIbZHwVubYnw3iJiTAyvvd6H+yyuN3
 bx4KeQLKSZ84+3zX1tfbKXSfvo+mJx89tPVv/FtV0u6m/m9UWc=
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
Cc: linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Mar 10, 2022 at 1:06 AM Joel Stanley <joel@jms.id.au> wrote:
>
> This reads out the status of the secure boot controller and exposes it
> in debugfs.
>
> An example on a AST2600A3 QEMU model:
>
>  # grep -r . /sys/kernel/debug/aspeed/*
>  /sys/kernel/debug/aspeed/sbc/abr_image:0
>  /sys/kernel/debug/aspeed/sbc/low_security_key:0
>  /sys/kernel/debug/aspeed/sbc/otp_protected:0
>  /sys/kernel/debug/aspeed/sbc/secure_boot:1
>  /sys/kernel/debug/aspeed/sbc/uart_boot:0
>
> On boot the state of the system according to the secure boot controller
> will be printed:
>
>  [    0.037634] AST2600 secure boot enabled
>
> or
>
>  [    0.037935] AST2600 secure boot disabled
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
> v2:
>   - Place files in aspeed/sbc
>   - Check for error when creating directory
>   - Print secure boot message even if debugfs is disabled

The implementation looks fine to me, but I think the changelog needs to
explain why you picked debugfs over a sysfs interface, and how the
interface is going to be used.

As a rule, sysfs interfaces need to be documented and kept stable
so that user space can rely on it, while debugfs interfaces should only
be used for development and never be accessed by applications
that need to work across kernel versions. If no stable user space
is allowed to access these files, what is accessing them?

      Arnd

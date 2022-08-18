Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CAC5982F6
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 Aug 2022 14:12:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M7kKF0JPzz3c4S
	for <lists+linux-aspeed@lfdr.de>; Thu, 18 Aug 2022 22:12:17 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=arndb.de (client-ip=212.227.126.133; helo=mout.kundenserver.de; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
X-Greylist: delayed 309 seconds by postgrey-1.36 at boromir; Thu, 18 Aug 2022 22:12:13 AEST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M7kK96dyvz2xHW
	for <linux-aspeed@lists.ozlabs.org>; Thu, 18 Aug 2022 22:12:13 +1000 (AEST)
Received: from mail-ed1-f52.google.com ([209.85.208.52]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mtxxk-1nUkrV36z6-00uJhY; Thu, 18 Aug 2022 14:06:57 +0200
Received: by mail-ed1-f52.google.com with SMTP id x21so1619045edd.3;
        Thu, 18 Aug 2022 05:06:57 -0700 (PDT)
X-Gm-Message-State: ACgBeo35kTlXufdd7+K7MZLi801O8Uw/vXs4EiXDRBTHQDMR8v3O9JQd
	/Sjgl6xRT/vQ5MA+mBLeOH5dH5eEc1YM+Xiy8ew=
X-Google-Smtp-Source: AA6agR7Sz6NPJtIQZSUoxG0aPUAHiTh3EAkYGAZrmlAF1RKyRr2hih2GPF/vQbUl19Y1aDytKituxOjsVxorJ/QDiyA=
X-Received: by 2002:a05:6402:520e:b0:43d:df14:fbed with SMTP id
 s14-20020a056402520e00b0043ddf14fbedmr2078468edd.16.1660824416882; Thu, 18
 Aug 2022 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com> <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
In-Reply-To: <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Aug 2022 14:06:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
Message-ID: <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:QP+E9PbV/xoPJlKNfF8C2aDQg8Mf+IQ+lm7ycX5++InzTwOUPiF
 UPKevyHY6a266yxDJ+rJbPjEpjeBYpTaX4cPv/xiV3MeUDZdgt0O+1aY6P6RbsGrTBHetw5
 onQAKUk+ebOKqn74oNzqAvPjV9K1sUarFhArxGl5vsuLBKGn+2JwzgZRr5AyLZiJJG1izlF
 4qy6/GYdEI2WSL9LNXJFg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kG0xIcsbpxc=:A3EyDmvTBFAKXv5ftGPKPo
 p14AEINN9a2d2ysdwL4cywTwm60Lyfs1kT1j5R9y7TPnk4XOj8vx11AcnCtxCn1Dkp5Gew4i2
 1zMKwWkLRxEhBPOz1OD+r56F8d5AUdwiZ8Cka3l8zaSvR2Mqa/w7IizD7pCm6AjG1J6/00889
 uljrvk3IH7FM5fBWyCJoCw90+7Bt+rO2FOzXosfukJROLeL5DENil1vf9YkfhRG3dobyoAf6H
 Prqyg8NalK+PRBI0oHBo7noSGV21cSnl/NpzVr+ZAmqaWhz1JnKa9tLsSgFbBPjX/umPT5Nr/
 izMVSGU/d7CaftEpklhnBD71BPqoyCd5wB2q2D+GelbiYVpsZ4UbJmVsQGZ3sEkbqCYv1gxvm
 sOSQ3QpPhLVAF9PwLsJer1o7QhcD0qt7Sw9nqaKDCZkkh5BnNMkYj+guWtx0V3i7CDGcVaoZg
 LA7rKT6Gr2gIdUf+EB4z9+K6348Syu83owGTsu0jIZJU8mYwd4dbG5K0r35jFcaj77Lhzru+u
 X8CJxAdHdYv/njdeb5Kc2jEZ22JqSoGXhv3vSBByhGS9L5hvNuxK5Pq2pznUEtidr5bEE85pW
 o2v8kneuubTT7zNpaSBbfca0kbptiEqJ68bAB6wtNzzhBbugvacX05MCYcNZSBaiVeuwyiegD
 +46R3yrOAbFQmPyxfh4lS9cHToMxmcVkuVr0coNVSjD7YVglqmuqvAey3QKaFNeC/uRWfK0YA
 1KAkVhWQ20llrEQP1hGcxTjaUiEI7mjyqamc2Kr+qZA5yVe5iNXWnxopUIFepSU7dr7NW6s/v
 vIkpwbCK7Cs9LAGxlGLICJY5rB1gr/TR2FoZRWVLj9DQ8IzWY5peigQJmWVt4xKhnKseWom6L
 VwBiMRFF2+1yXJiI+psw==
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, thang@os.amperecomputing.com, linux-kernel@vger.kernel.org, Phong Vo <phong@os.amperecomputing.com>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Quan Nguyen <quan@os.amperecomputing.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Open Source Submission <patches@amperecomputing.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 18, 2022 at 9:33 AM Joel Stanley <joel@jms.id.au> wrote:
> > +
> > +/ {
> > +       model = "Ampere Mt.Mitchell BMC";
> > +       compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
> > +
> > +       chosen {
> > +               stdout-path = &uart5;
>
> I know you've been told by Arnd and others to remove the default
> command line here, but without it your device tree fails to produce
> any output in my tests:
>
> qemu-system-arm -M ast2600-evb -nographic -dtb
> arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dtb -kernel
> arch/arm/boot/zImage
>
> Without a working test, I can't tell the difference between a broken
> device tree and one that omits the serial device on the command line.
> Can you work with Arnd to come to a solution here?

If you use qemu as the boot loader, I think the expected way to do
this is to use the "-append" command line argument along with "-kernel".

Is there any reason for this machine to be special here?

       Arnd

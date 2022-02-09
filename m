Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E80C4AF553
	for <lists+linux-aspeed@lfdr.de>; Wed,  9 Feb 2022 16:34:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jv3nt5ySmz3bWG
	for <lists+linux-aspeed@lfdr.de>; Thu, 10 Feb 2022 02:34:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PvhHN1x9;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PvhHN1x9; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jv3nk1NMpz2yPL
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Feb 2022 02:34:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 57F79B81EB6
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 15:33:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23219C340F0
 for <linux-aspeed@lists.ozlabs.org>; Wed,  9 Feb 2022 15:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644420837;
 bh=94JhqkfPyGm5fI8uqElS/q7uYfUeEV75ByfM2U5lMf0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PvhHN1x99kHaQ6SIeyKuc0HYSgDdAaE+QFS/bnBHwZPoi9p/NkYGRuMUHaUutZKry
 dpyazFKmdc1w5tuQjVRo4n9aPQW8L0V4eOU3RMC2kINmblqFq88nzgnU7RayND1wSS
 OzZWkZ/CZsKt5MQUAq+EikE2Sxdqvo2ORJY+/XQwG7FcMeCg8fztKx/4vKw0KES94f
 x1eLiYZDbvBEG2OQ3oF88V7jjFQa70Mp31ldavrQ63rlPdDbmDo11HsIBanS+hod7q
 VvxuugfESSaFi2P4S67g+43J5xH7SVRIIzV3L2lIz2VMJ86H+GqiuuKsCGcHsMJ1eb
 pRIsj+OCLASbw==
Received: by mail-ed1-f52.google.com with SMTP id eg42so5846342edb.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 09 Feb 2022 07:33:57 -0800 (PST)
X-Gm-Message-State: AOAM532Rl5EFP3A5nJUFT9A3hwAdMiZdN8QDdaPsj3MzAr0YpclsalMU
 YcBH23FKtzYohBCE3FrUDHQIF1sbvxgDoRoIUA==
X-Google-Smtp-Source: ABdhPJxIQT/yPUyK1ZYhL/YnMo/s0Nictx67v1DM0eQXfYq4bvcfzBEBoc+KIS1H6jV+lGZW2y3nv/axCNFkNwiiq80=
X-Received: by 2002:aa7:d406:: with SMTP id z6mr3167126edq.66.1644420835447;
 Wed, 09 Feb 2022 07:33:55 -0800 (PST)
MIME-Version: 1.0
References: <20220209100413.23714-1-potin.lai@quantatw.com>
In-Reply-To: <20220209100413.23714-1-potin.lai@quantatw.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 9 Feb 2022 09:33:44 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLM552FjvjdECq56kYsx9+mPuyvpUNibtuH--pgyF4pDQ@mail.gmail.com>
Message-ID: <CAL_JsqLM552FjvjdECq56kYsx9+mPuyvpUNibtuH--pgyF4pDQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] arch: arm: dts: update bletchley dts
To: Potin Lai <potin.lai@quantatw.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Patrick Williams <patrick@stwcx.xyz>, Allen Wang <Allen_Wang@quantatw.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Feb 9, 2022 at 4:04 AM Potin Lai <potin.lai@quantatw.com> wrote:
>
> updates:
> * seperate leds into multiple groups
> * switch sled numbering to 1-based
> * disable inchip rtc
> * add flash1 in fmc
> * switch spi2 pnor using spi-gpio
> * update gpio-line-names
> * add interrupt pin for each sledx_ioexp
> * enable mdio3
> * update ADM1278 shunt resistor (300 micro Ohm)
> * add INA230 for each sled

Please read documentation on writing commit messages. Answer why you
are making the change, not what you are changing.

Each bullet should probably be a separate commit. The question to
answer is are there compatibility issues (what happens with old DT and
new kernel and vice-versa)?

Rob

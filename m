Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7335A2FD3D
	for <lists+linux-aspeed@lfdr.de>; Thu, 30 May 2019 16:17:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45F8mQ3tplzDqT9
	for <lists+linux-aspeed@lfdr.de>; Fri, 31 May 2019 00:17:26 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::744; helo=mail-qk1-x744.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="Lp7NHqOw"; 
 dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45F8mC4VCWzDqT7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 31 May 2019 00:17:15 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id a27so3925911qkk.5
 for <linux-aspeed@lists.ozlabs.org>; Thu, 30 May 2019 07:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+LOT5T/HmBUsdzCxRl5dLbbljv3/ECxiQWhmt5quQ0=;
 b=Lp7NHqOwMPQVLwKjwmPtyYv6BBVOczLj1a73C6xr2V2zY9ATwNY9UPq8yXTSXrkq5r
 L4phwmL0wNDGV9sklxFEuTIUL0WNtXLLw3syl3N7eBtW8YXwsMmtpFKW9fTFvEto0imz
 ylPC2npd0R+mRKamHItWAhq5iJJGp8hp4cE+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+LOT5T/HmBUsdzCxRl5dLbbljv3/ECxiQWhmt5quQ0=;
 b=Tc62LFWfp3s6C0cz1wMRWZPXgiOIXjWKXKXhotfdOFCX/6JfFIhnkVF9WtPYcilyLm
 dxCWCQEX2DwzTZCxjw6p6xLKLJxsTrnRWYqJTB/bB5UexWQ3xJWCT+gIcc+HaLQnKEx6
 BRPeIKkWMxtLhjQoSbosReW7GaHPcqoIWAWPhNh5t+FfwHmqxQ5S8HoJ2aAMhi2vu7j4
 EiG14srrUFkdALS/xRXo/ePZKKYrF/TWLddR0uHK+n9DcXwnjUsJ0jUCYwVZrDvdWzB0
 UmRCti2qedww38128a0G9MZrI3ifYPFz8TEeApQjJv7G409eIFaTIRmahcs5lWtfencV
 HsLg==
X-Gm-Message-State: APjAAAXs2qlOKPY55laMtj1BcD8mBfo1lOqlxvepUIVLJTDsgTArhVpW
 Co2f+IlX6Qo1sjJY9Ep4FsrEiEwBw5faKnpXqDY=
X-Google-Smtp-Source: APXvYqxvcdqalIqdQbZ8c+pH8PwVq3is068RciFxLPOT3so+FaMecraJ+Da1cHA1B+kh92m1vrm1sTnOMVgRKO/Dr+E=
X-Received: by 2002:a37:a3c5:: with SMTP id m188mr3485959qke.223.1559225831160; 
 Thu, 30 May 2019 07:17:11 -0700 (PDT)
MIME-Version: 1.0
References: <20190530093948.12479-1-a.filippov@yadro.com>
In-Reply-To: <20190530093948.12479-1-a.filippov@yadro.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 30 May 2019 14:16:59 +0000
Message-ID: <CACPK8XfG7j4Z2bqX9CFxUeUrpx708Uqbh-5ts9W5SnDfDw-xYA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: Add YADRO VESNIN BMC
To: Alexander Filippov <a.filippov@yadro.com>
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
 devicetree <devicetree@vger.kernel.org>, linux-aspeed@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 30 May 2019 at 09:40, Alexander Filippov <a.filippov@yadro.com> wrote:
> @@ -0,0 +1,262 @@

Can we get a SDPX license string at the top of the file? Something like this:

// SPDX-License-Identifier: GPL-2.0+
// Copyright 2019 <copyright holder>

> +/dts-v1/;
> +
> +#include "aspeed-g4.dtsi"
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +

> +&i2c3 {
> +       status = "okay";
> +       cpr2021@59 {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               compatible = "general,cpr2021", "general,pmbus";

Do you have a driver for this one you plan on submitting?

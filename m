Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 550D943761
	for <lists+linux-aspeed@lfdr.de>; Thu, 13 Jun 2019 16:54:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PmwW26LPzDrB8
	for <lists+linux-aspeed@lfdr.de>; Fri, 14 Jun 2019 00:54:19 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=krzk@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="TcJCjqav"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PmwL25nJzDrDq
 for <linux-aspeed@lists.ozlabs.org>; Fri, 14 Jun 2019 00:54:09 +1000 (AEST)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D525221744
 for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2019 14:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560437647;
 bh=GYf/+gkGyncHp31uy7FPojBQ7mL+yl6nzbXTfvhlMGc=;
 h=References:In-Reply-To:From:Date:Subject:To:From;
 b=TcJCjqavWAlojNJrYEhlAxJC2cZ5+UcNQ+J8ry2eA6PDcyKHn5GTWrvlFPceYjtSN
 fNESd+v8TcrthsynLoOq6/UUiPKuYYYpkBjUXEUYtQvUnIEhzpGldliabELRtYoQf4
 H75jbCoov7obKq4HVZrmdfy9zEZ/PwTSrtP3JxCc=
Received: by mail-lj1-f182.google.com with SMTP id t28so18824668lje.9
 for <linux-aspeed@lists.ozlabs.org>; Thu, 13 Jun 2019 07:54:06 -0700 (PDT)
X-Gm-Message-State: APjAAAUZK+PbUpuM0JtNrKdHndZS4TRjOi7TLTPf0gkKplVlaqSRezdS
 c9sKtvwf/2Ws5TLp3JVnFHcoitE37Geab6LNVb4=
X-Google-Smtp-Source: APXvYqxHuV7Q03SqzPQJxsXIaEVNMtkbU1nrHhyj83hOaQCq0FDxpomV2Y8SgjCcQw0UPaOf6ZfRnkeRkUssQQzCFAM=
X-Received: by 2002:a2e:124b:: with SMTP id t72mr39255568lje.143.1560437645055; 
 Thu, 13 Jun 2019 07:54:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190604185229.7393-1-krzk@kernel.org>
In-Reply-To: <20190604185229.7393-1-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 13 Jun 2019 16:53:53 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd4LVFGgonbsuxii-5Fu5wWhxU9yotLHw+OXsPcxYw_3g@mail.gmail.com>
Message-ID: <CAJKOXPd4LVFGgonbsuxii-5Fu5wWhxU9yotLHw+OXsPcxYw_3g@mail.gmail.com>
Subject: Re: [PATCH v3] ARM: configs: Remove useless UEVENT_HELPER_PATH
To: arm@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org
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
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 4 Jun 2019 at 20:52, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Remove the CONFIG_UEVENT_HELPER_PATH because:
> 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
>    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
>    made default to 'n',
> 2. It is not recommended (help message: "This should not be used today
>    [...] creates a high system load") and was kept only for ancient
>    userland,
> 3. Certain userland specifically requests it to be disabled (systemd
>    README: "Legacy hotplug slows down the system and confuses udev").
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> For vexpress:
> Acked-by: Sudeep Holla <sudeep.holla@arm.com>
>
> ---
>
> Changes since v2:
> 1. Remove unrelated files.
> 2. Add Geert's ack.
>
> Changes sice v3:
> 1. Change also mini2440_defconfig.
> 2. Add more acks.

Hi Arnd and Olof,

Do you want to apply it directly or maybe I can send it along with
other my defconfig pull request?

Best regards,
Krzysztof

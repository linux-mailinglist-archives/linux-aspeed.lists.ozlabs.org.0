Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3E955BEB
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2019 01:03:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YMCX3g0jzDqXf
	for <lists+linux-aspeed@lfdr.de>; Wed, 26 Jun 2019 09:03:36 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lixom.net
 (client-ip=2a00:1450:4864:20::241; helo=mail-lj1-x241.google.com;
 envelope-from=olof@lixom.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lixom.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lixom-net.20150623.gappssmtp.com
 header.i=@lixom-net.20150623.gappssmtp.com header.b="nwNBXy7u"; 
 dkim-atps=neutral
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TSvL0QKmzDqs8
 for <linux-aspeed@lists.ozlabs.org>; Thu, 20 Jun 2019 01:06:01 +1000 (AEST)
Received: by mail-lj1-x241.google.com with SMTP id x25so3639025ljh.2
 for <linux-aspeed@lists.ozlabs.org>; Wed, 19 Jun 2019 08:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lixom-net.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=BDvPZcVC+gwwybYP6ypnMMEtrxI72JBl/3PlooRRbfQ=;
 b=nwNBXy7ugHOIpZRcqq/rviBTBBpICuuG2sMFsTUx8q7ghVnffYjoh226yLeNczTF5Q
 QiiYiaiIc65I16YWjKfCI1sKStqQmEeYP5ZcV45bAlTGIMUkZsZn+RJXNVF4M2oHZ9DJ
 Kv97PrR2qOCaBip2yTuA05gd2YQGXd+2Xdtcdkp5/Al/FmzdmGFC+Zwg3xHcO/Fz67Vp
 8OmnowgxqSMY+JeKLQ/9d6rMl4QVb1w8OGdoW2l3JbxbmsUZAkqjy5LhLC8R9awH0MIj
 h8ijKFkzC6ZYj2MLpaebB5Jl/XaJPRrnAZL6FT89ThmOITgCtC1jdtrivJusj7h//Rbs
 /xYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=BDvPZcVC+gwwybYP6ypnMMEtrxI72JBl/3PlooRRbfQ=;
 b=DlWq+RIwtAwbXZXxJ6MKPtrk5gNAroQ79//cOwP7Hi0XRs7TK9eigsg6n7mKnn0SjD
 3eAUPhWxfoGT0M2mnAJa3q3mE6WqYQiUc+PidyOXZWU92MsVupQdPjAiPaEcP3R1IFEu
 qWvcjRd/iTJGAuLudtnSVhBkd3bTpp0b4jmPjYlkYKIKKUY8pF/yTUqkQgGfvTvK/pEu
 +eIm7Uo8/BmlbdtNGnitI9RpuCD4D7zmG9OBjq0r/c4Fx2JaZSNCGlm3VC62xrXtKSh9
 qfrL7LQLzWHikR6epj0HlOX/Ns73ueJSlhP1E8+taq0Fm8QbMz1VbeKLaqAW/DtpuIRl
 ZCIQ==
X-Gm-Message-State: APjAAAV/PoXnrMkTXvropf3gyNmNjYTpwf2CiTqKTjcIT3astOqD6Gew
 dBW8T+tnwXYjBi3FDTGHD3egxQ==
X-Google-Smtp-Source: APXvYqwx5U2uWXAu+vwQMCy9hcnvOqeOjcjGcEeeSmsWGmC1iZtQE4bHSeFmxejgtQLupjolK6lIwQ==
X-Received: by 2002:a2e:9188:: with SMTP id f8mr7118830ljg.33.1560956756417;
 Wed, 19 Jun 2019 08:05:56 -0700 (PDT)
Received: from localhost (h85-30-9-151.cust.a3fiber.se. [85.30.9.151])
 by smtp.gmail.com with ESMTPSA id q1sm2736416lfc.79.2019.06.19.08.05.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 08:05:54 -0700 (PDT)
Date: Wed, 19 Jun 2019 07:09:24 -0700
From: Olof Johansson <olof@lixom.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] ARM: configs: Remove useless UEVENT_HELPER_PATH
Message-ID: <20190619140924.cl33iuqndoigldgi@localhost>
References: <1559636093-26005-1-git-send-email-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1559636093-26005-1-git-send-email-krzk@kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Mailman-Approved-At: Wed, 26 Jun 2019 09:03:28 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mans Rullgard <mans@mansr.com>, linux-aspeed@lists.ozlabs.org,
 Tony Lindgren <tony@atomide.com>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Aaro Koskinen <aaro.koskinen@iki.fi>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Russell King <linux@armlinux.org.uk>,
 Ludovic Desroches <ludovic.desroches@microchip.com>, arm@kernel.org,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Jason Cooper <jason@lakedaemon.net>, Arnd Bergmann <arnd@arndb.de>,
 Marc Gonzalez <marc.w.gonzalez@free.fr>, Sascha Hauer <s.hauer@pengutronix.de>,
 Vladimir Zapolskiy <vz@mleia.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sudeep Holla <sudeep.holla@arm.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, Jun 04, 2019 at 10:14:53AM +0200, Krzysztof Kozlowski wrote:
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
> 
> ---
> 
> Changes since v2:
> 1. Remove unrelated files.
> 2. Add Geert's ack.

So your other patch added mini2440 in a follow-up patch, but this one doesn't?!

Applied with that fixup.


-Olof

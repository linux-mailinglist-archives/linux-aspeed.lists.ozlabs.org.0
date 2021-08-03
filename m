Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 226B73DE66C
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Aug 2021 07:58:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gf40x736hz30FK
	for <lists+linux-aspeed@lfdr.de>; Tue,  3 Aug 2021 15:58:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=diBrfg3s;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82c;
 helo=mail-qt1-x82c.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=diBrfg3s; dkim-atps=neutral
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gf40t0QyXz2yXX
 for <linux-aspeed@lists.ozlabs.org>; Tue,  3 Aug 2021 15:58:05 +1000 (AEST)
Received: by mail-qt1-x82c.google.com with SMTP id t18so13275514qta.8
 for <linux-aspeed@lists.ozlabs.org>; Mon, 02 Aug 2021 22:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=A8r1SOnghP/MBO4ignCwnrhJci8PgXDgxCYfoAoBqoM=;
 b=diBrfg3sOAjAdEgR2fwx5obH5BQMLqcZg+0HoS3Mm+v0wWlsTHJim4DrIaVp+06oco
 yq8pEbh/ioAUlzrWbFtle+fHa9D23Uu1hCDfgRSrZjQ1cjtEz/Q+ITDYifLNb1YWLoMo
 Qktc+tzAtpyX4SIqgjp/anumj2joR8zCF00co=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=A8r1SOnghP/MBO4ignCwnrhJci8PgXDgxCYfoAoBqoM=;
 b=ijFY9K+mlZAqjCKnYWdgeSFrhIt+ShruPcBIpOQZXfXlmx7o2JqCmbiK6TisyOnLSo
 GSmQj7YrrXuvSPZjovj/TnJ7UqwsM9oD3lrR0+8p9lftCGVupalLm3PwEjphslf30Wo5
 /1jCV5FLJ8FrI8kRGaviDMFPdliTEDgiG4gg4JarXZXAFFagBv2SmcQcAwUzzc0HYaBc
 BWyaFSpz4Ff2TzCx4oo/uDaJqlu5fF2notLoRZVVZ+VonCyG6C652XNnO4AljxzxB9nz
 YS7asICrzpP2OWvmfGuIKYrVq/cVyGq3jCPKmgTASkg34S2/QuBWHHNB8GxsXXtdgHTD
 vs0A==
X-Gm-Message-State: AOAM530ZILHK6/McSujgKLgb6HLmuVco0GkJmTictV2ayUd25f+0qf9M
 yI/YeX3oqw1TCPSsva7LV4jpC6r0HAuX9lSQN40=
X-Google-Smtp-Source: ABdhPJxqNKg77SS3jHcROLjxWjGxNdgL8Z+BYVHbG4gOIjY5GnEIA0nxzuTN50vPMyHjoExsVMAkoBiep3qlFYYYuHA=
X-Received: by 2002:ac8:6697:: with SMTP id d23mr16993913qtp.135.1627970281534; 
 Mon, 02 Aug 2021 22:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210712100317.23298-1-steven_lee@aspeedtech.com>
 <CAMpxmJXfUterUdaGHOJT5hwcVJ+3cqgSQVdp-6Atuyyo36FxfQ@mail.gmail.com>
 <20210723031615.GA10457@aspeedtech.com>
 <CAMpxmJU4jN-hpNYPLHLbjx4uZ6vDqcyuMVQXhHg1BWXOqyS22A@mail.gmail.com>
 <58256e8f-6c9a-4ad4-b51e-4048b6feb42a@www.fastmail.com>
In-Reply-To: <58256e8f-6c9a-4ad4-b51e-4048b6feb42a@www.fastmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 3 Aug 2021 05:57:49 +0000
Message-ID: <CACPK8XdfisvSzr3uWYmfd+u1UtM5+cyMBMvcDZJ+jQ38A1BSXg@mail.gmail.com>
Subject: Re: [PATCH v6 0/9] ASPEED sgpio driver enhancement.
To: Andrew Jeffery <andrew@aj.id.au>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 3 Aug 2021 at 04:49, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Fri, 23 Jul 2021, at 17:00, Bartosz Golaszewski wrote:
> > Joel, Andrew: can I take the GPIO patches through the GPIO tree and
> > you'll take the ARM patches separately into v5.15?
>
> I think that should be okay. I'll poke Joel.

Yes, that's fine. I have merged the first four patches into the aspeed tree.

Cheers,

Joel

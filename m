Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE91279BA8
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 23:57:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yD7j1grdzDqRt
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 07:57:37 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::141; helo=mail-lf1-x141.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="sVE9zpEA"; 
 dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yD7c1mkFzDqQd
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 07:57:31 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id h28so43102462lfj.5
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 14:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WhB+RZ2P4weNNxlV3JiaH27Cy16VoQbodVkM+yi6FAA=;
 b=sVE9zpEAJSM4jgNF+JxW1v7N1fcEZmKVkBwXW6KNsVWmVQFLHqD9d+xWPT9I2jAv7d
 TWVaNyRqpnOg3/0m2gk7Ch7jfca9Jh7XmgTvTp/mhbO/osy8RPidS52ZbciVLnLEwdVN
 13aomLVoHqKP8mi75hzRriyJh55sc4+nlArQq/OmMsDigdVM12/m5kKoc0QeQ0A/N+rn
 uT5q2dRFCTZxrWDs9LEKNvSy227d40I8Q4tKWwgJf09KBFWvYLj22dKO7HSBJthn38/j
 qYBSQpexpirObv7xVzyDVw0nZYVjTHFYX1mCs0JG/ZipMEBdkq6//TrU3cy7vGuxUxj1
 Nt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WhB+RZ2P4weNNxlV3JiaH27Cy16VoQbodVkM+yi6FAA=;
 b=UInspauOJ5LNAeehXBmK5VBGaXqdPMQ58/tfAkfWTCX6jupgBBopgp6txVFEdYS5lp
 l8N0wrmDXaJ7FRVTCgor+8v3FEbr5ithHNlxO3hnTVqvkYbTNlmiI1SqA+mhS2B7UfGh
 IaI5URk1FsIzTiqrfv4qqEgSsLGE9WENusWwCJSpN221C0UsgX6/4eZcOXM1iHO6mNP8
 J48a6gKIFW7vys9uMahIbJHYgs9oZ795J0fqBx9NS+6IVItGdHkHYVkaNuFcDruOIdQp
 FwGGIMYF5OwCckgVYgmzXMz3pj2RlPgt40wmf8AJUalbpzhKuimc/TZA6Gzu9emwuUKI
 LNJA==
X-Gm-Message-State: APjAAAWbWvL0ld6CVX2adj/Yon8RfYARp3rLl5ckF+1joPNJObzMz2ha
 hFaRZ5zI/IReTFUn9jmmglvDgyPcxghYAVzXGixLKg==
X-Google-Smtp-Source: APXvYqyBnwkv1VRTZGXZco57yirARpTFLPJRJ/RvgElvK8IXTHcFCH30jet7L01e4aA0VROLzr8OPXOGn2X/EdVc1D0=
X-Received: by 2002:ac2:4891:: with SMTP id x17mr54444437lfc.60.1564437448905; 
 Mon, 29 Jul 2019 14:57:28 -0700 (PDT)
MIME-Version: 1.0
References: <1563564291-9692-1-git-send-email-hongweiz@ami.com>
 <1563564291-9692-2-git-send-email-hongweiz@ami.com>
 <CACRpkdYhVoP75ZDfASW+DH5yf-a5diitiXsh7eLsJx5hsTC9sQ@mail.gmail.com>
 <ef9d9c17-6e2d-4a4e-ac44-f8da4bb3b8eb@www.fastmail.com>
 <CACRpkdZxsF9gQj0VicVLsPKXg6rKA1mLwbywmazOf0w8PLnOfA@mail.gmail.com>
 <f2875111-9ba9-43b7-b2a4-d00c8725f5a0@www.fastmail.com>
In-Reply-To: <f2875111-9ba9-43b7-b2a4-d00c8725f5a0@www.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jul 2019 23:57:16 +0200
Message-ID: <CACRpkdZcLNe+oM1jWPpva0LECc-P48ab3H-kG7eabMmSvmvioA@mail.gmail.com>
Subject: Re: [v5 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <hongweiz@ami.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jul 29, 2019 at 2:19 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The behaviour is to periodically emit the state of all enabled GPIOs
> (i.e. the ngpios value), one per bus clock cycle. There's no explicit
> addressing scheme, the protocol encodes the value for a given GPIO
> by its position in the data stream relative to a pulse on the "load data"
> (LD) line, whose envelope covers the clock cycle for the last GPIO in
> the sequence. Similar to SPI the bus has both out and in lines, which
> cater to output/input GPIOs.
>
> A rough timing diagram for a 16-GPIO configuration looks like what
> I've pasted here:
>
> https://gist.github.com/amboar/c9543af1957854474b8c05ab357f0675

OK that is complex. I agree we need to keep this driver together.

Yours,
Linus Walleij

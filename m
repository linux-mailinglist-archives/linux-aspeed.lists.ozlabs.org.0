Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 008E386C432
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Feb 2024 09:52:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sRpSLnAd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TllNB4Qfnz3dVS
	for <lists+linux-aspeed@lfdr.de>; Thu, 29 Feb 2024 19:52:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sRpSLnAd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TllN43TWxz3bcP
	for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Feb 2024 19:52:19 +1100 (AEDT)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-7da763255b7so274026241.2
        for <linux-aspeed@lists.ozlabs.org>; Thu, 29 Feb 2024 00:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709196734; x=1709801534; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF5DuBghLmmfecZ0ApkaWQPQ9anCHIv1MhLlebuBimY=;
        b=sRpSLnAd0EfrwQYfgd+HGsvOEZFfG8mae8cSTH2n2VSJusPizGUQRKtEBfAy/Zk4TJ
         wSZMVLHpBXRIfnywHb2Og9J8+QK1JHT3kxSBiBsnoEfbPAUhiSf96Uki6zdl+YG5zEo4
         g23ANwTvgUJGFzSOJV9lU2CuYbd+yl2w/5Oo64GXVioElw+0fWRpPOOkfbeV9inlGM2I
         ecHjOFGOBascWuw0CVeQPBKm/POQxSiiHU1HJUZ4Z5DW7s4yt4/W7Y7pm2PcALqYU29Q
         teF1QrG2ryOUSe2GJ48nh+2DrUkpECY/j4le3E83RXiAADdW2d8E6QEMjR6KLS85Kkop
         5PxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709196734; x=1709801534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF5DuBghLmmfecZ0ApkaWQPQ9anCHIv1MhLlebuBimY=;
        b=Y7Oo1dznMg6F+Xb0VH5VV6eZX3/5E2fx5CdnwpjlQPeCzzs8SpoqYBNXHSFPL/kv6j
         pJ1HNpiQlTHXfUSKvjEfPxwnwRkblMWeiqTg7gYYX7czGs/B3AbMmuT7whkhPt+20zsi
         WxZQrha1mIJJHggnTCKtc4zEZApw18yGc2+lvykMHvu26IpKt0sbVE9V/L88cYRo6XIe
         eatcf7sRfz4fz+E+qEoeeeAU5LOOZ+LBLSD0967gow7tDJzTeIQqIg6uTk4PJwE2vWQW
         nl8bzLaKi3KYXp9dny3TUAo92Df3UT8N2PIsx/qjwgsI9QO7ErmHCIXznMmo/+pnkD+o
         F1qw==
X-Forwarded-Encrypted: i=1; AJvYcCWoUJq+zNcIafW5X3i/3Hcx1rKhkWhUdnqrBM5JV6D07WYpCqiWmJ0m541BRAM+jtZDvLc/VDUr8Dpm2zK5b3hBVrst9NbPYMnx4sWAYQ==
X-Gm-Message-State: AOJu0YyETUM9bifIUzvRFd1ZZcNYEYLBskYcYF67puvyNLGXwQsarRXi
	LSjWAPOVdy8nes1PlCsrANwhutQ+wKes/7l4TrjF0cvvheAEbJcffn1FHOpizQqdnUZuENLNFrx
	X7HKq9CqtkG5vaoSJtSo43WmMRdwDUjI8JwoEBg==
X-Google-Smtp-Source: AGHT+IHbBbHHyoTCwTXjEiUtXJpiz6BhCSbOxdkUtr733pUyh3x+4zQ6uEUSQ0oCrpHEUchMroR3h+wu7xVCP5wL+FE=
X-Received: by 2002:a05:6102:2913:b0:472:6b03:7ef9 with SMTP id
 cz19-20020a056102291300b004726b037ef9mr1336840vsb.32.1709196734646; Thu, 29
 Feb 2024 00:52:14 -0800 (PST)
MIME-Version: 1.0
References: <20240228003043.1167394-1-andrew@codeconstruct.com.au>
 <c2060450-4b76-4740-afe4-d14717245f01@linaro.org> <16ddd99007176da3f84462de217cb76c8fa4e1bd.camel@codeconstruct.com.au>
In-Reply-To: <16ddd99007176da3f84462de217cb76c8fa4e1bd.camel@codeconstruct.com.au>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 29 Feb 2024 09:52:03 +0100
Message-ID: <CAMRc=MeEyo7y-G1saydxtTRedNtHPaEeLANuzXt6KsiDU2jOWw@mail.gmail.com>
Subject: Re: [PATCH v6] dt-bindings: gpio: aspeed,ast2400-gpio: Convert to DT schema
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-aspeed@lists.ozlabs.org, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Feb 29, 2024 at 4:21=E2=80=AFAM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2024-02-28 at 08:47 +0100, Krzysztof Kozlowski wrote:
> >
> > You still have way too many examples. One is enough, two is still okay.
> > We really do not want more of examples with minor differences.
>
> Noted, I'll keep them to a minimum in the future.
>

As in: I'll still send a v7? I can trim the examples when applying,
just tell me which ones to drop.

Bart

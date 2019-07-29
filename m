Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D033579CEE
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 01:40:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yGQc43bYzDqMH
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 09:40:40 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="0vDcQ4xj"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yGQT1R99zDqDy
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 09:40:33 +1000 (AEST)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9530E217D9
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 23:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564443630;
 bh=7+dKYuXRCa5ZF1sBBLaJXHlVEQeYcSawe/De6ZYjmjc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=0vDcQ4xj3eYYqyHRsoPwWx4XMC9sn9G3ZnGDzKIxtBwXez3BEMlcv+otZT3btTl1j
 o9/II04NLT9fbKTQsjCZHrJeE7u9Dss/066Bou0MdQFSlAmalvBllLKkVu5hukB6Jw
 9WnY5rgoztDcU/orTdQkZ5PGL1fqvcDi7lINf4sI=
Received: by mail-qt1-f169.google.com with SMTP id y26so61262111qto.4
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 16:40:30 -0700 (PDT)
X-Gm-Message-State: APjAAAWbr0Jn29djzdD5NDyZcfq9FSkFEEWpko0KNJKXkKKmyZpC149U
 /jrk1FVEh3N1BPPDy8BG56Gnh2wwyiJL+XC3OA==
X-Google-Smtp-Source: APXvYqyaCa+KVNuh9jCj7c0XvJUMcuDC4MQz9V9TU0flj76XUMhpBDn4frU2dByCzFiQI8HP63DdqNt3RAGN9tT5U6Q=
X-Received: by 2002:a0c:baa1:: with SMTP id x33mr82268862qvf.200.1564443629749; 
 Mon, 29 Jul 2019 16:40:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190729055604.13239-1-andrew@aj.id.au>
 <20190729055604.13239-2-andrew@aj.id.au>
In-Reply-To: <20190729055604.13239-2-andrew@aj.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 29 Jul 2019 17:40:17 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0f=jWJ2QTNzi+pmvzTpVacbP_C0zgpOwTumwJU7Gh=w@mail.gmail.com>
Message-ID: <CAL_Jsq+0f=jWJ2QTNzi+pmvzTpVacbP_C0zgpOwTumwJU7Gh=w@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: pinctrl: aspeed: Document AST2600
 pinmux
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Johnny Huang <johnny_huang@aspeedtech.com>, linux-aspeed@lists.ozlabs.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Ryan Chen <ryanchen.aspeed@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, Jul 28, 2019 at 11:56 PM Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST260 differs from the 2400 and 2500 in that it supports multiple
> groups for a subset of functions.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> ---
> v2:
> * Avoid patternProperties for fixed strings
> * Don't needlessly quote strings
> ---
>  .../pinctrl/aspeed,ast2600-pinctrl.yaml       | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/aspeed,ast2600-pinctrl.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

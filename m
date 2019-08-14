Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B4D8CD5E
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 09:59:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467hnf4NbkzDqhN
	for <lists+linux-aspeed@lfdr.de>; Wed, 14 Aug 2019 17:59:50 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="vv74Giis"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467hnS1wMYzDqfW
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 17:59:38 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id t3so15402748ljj.12
 for <linux-aspeed@lists.ozlabs.org>; Wed, 14 Aug 2019 00:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vktWgJym3yCRgx3u45+g969459no7O3RZoGUxegUaEA=;
 b=vv74GiiskJwY6lBYmg6l4Zu9bHeALT4JI0bsJH4KFIuDlc1IIX6AEDJZ50lghMVEX9
 WKFFLzL6FyE3/Rs/Tf1xpXrnZanOyGWbjge1UfMjdE3r9+SVchOzBvMZFj18Zvih5p2z
 nncsdqMtWCBV2cMJxXNWcJzLzD5rgb3Y8SujIq/WjWvCRb0VaSFSiqYGIDUhgva3k6Li
 tC8RsunDocuTF/tvfbMzW6gazz1TVpdAWr4aCsEYOOwSmqwb9ukuI3vLqpnJvDEwCxpK
 Q61KnvPx9eCK8RsiX4fD7sKaYovdCd/FEf7RZ5l+HOwc3mlUsK/wRWSb1So/EgnyAI9L
 xSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vktWgJym3yCRgx3u45+g969459no7O3RZoGUxegUaEA=;
 b=cvvIqxdp8Q0E6yVbYSxwAez8qvC6H9V4uKO0pIUQqAoFMXuwYssVj0XhP1GyFTweh0
 A6geUU6/VMPsN/zNOJwwiRN97biLMTlH2cSgSSO4HkSZz12S7t6YU2h7Q5qrtPoelJN9
 1Mjr+P6Z8kxiYCuo46EL30fi+RGAKDBJVyE5ttZgSFS/pgUgRYWIoeRAy4dBxaSc0UfH
 Ue8vs6pTz3k5ylYNA0/0ccxJHUl6HT9OSEASM/1+ACK5Yo8alEqD1r96fdPTZH+ZLyTD
 HteKn+EwtlN8+a+CDlHlF9FpMZu6tFptIcIGeU3J0eWfGNFj7pZsR+Q9wCtfpXxnFbpP
 EDNw==
X-Gm-Message-State: APjAAAXlkj+gs8ZM2bddvnhU8JUu83mm7B9ewkpUP2jIeRle9475QloN
 pC3F02LbF4kEUtij8z11UKLeWLfng0CCfHwyYlitGA==
X-Google-Smtp-Source: APXvYqyu0HbKHviVbPJdDWFqmy4PxLilmJoLtCGqXaaggcm5lCdH90/gDgxNiL8hStl1RMJZCYuS/NRIVXNAMlY2Kq0=
X-Received: by 2002:a05:651c:28c:: with SMTP id
 b12mr18693136ljo.69.1565769574230; 
 Wed, 14 Aug 2019 00:59:34 -0700 (PDT)
MIME-Version: 1.0
References: <1564603297-1391-1-git-send-email-hongweiz@ami.com>
 <1564603297-1391-2-git-send-email-hongweiz@ami.com>
In-Reply-To: <1564603297-1391-2-git-send-email-hongweiz@ami.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 14 Aug 2019 09:59:22 +0200
Message-ID: <CACRpkdaGe4G17Pv0+X=zcgfwikv8sr+m55NZNZu5JMtLOYjaAQ@mail.gmail.com>
Subject: Re: [v7 1/2] dt-bindings: gpio: aspeed: Add SGPIO support
To: Hongwei Zhang <hongweiz@ami.com>
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
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2019 at 10:01 PM Hongwei Zhang <hongweiz@ami.com> wrote:

> Add bindings to support SGPIO on AST2400 or AST2500.
>
> Signed-off-by: Hongwei Zhang <hongweiz@ami.com>
> Reviewed-by:   Andrew Jeffery <andrew@aj.id.au>

OK timeout for further DT binding review. I adjusted a bunch
of things like whitespace and referencing other files when
applying.

Yours,
Linus Walleij

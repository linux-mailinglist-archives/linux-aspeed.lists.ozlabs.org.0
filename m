Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0746D79B9A
	for <lists+linux-aspeed@lfdr.de>; Mon, 29 Jul 2019 23:55:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yD5C4NFwzDqQr
	for <lists+linux-aspeed@lfdr.de>; Tue, 30 Jul 2019 07:55:27 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="maX1fJR4"; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yD5739dbzDqKb
 for <linux-aspeed@lists.ozlabs.org>; Tue, 30 Jul 2019 07:55:22 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id y17so35491407ljk.10
 for <linux-aspeed@lists.ozlabs.org>; Mon, 29 Jul 2019 14:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WBZi/FWYMVw+6x0q1L6ySXMBwWz8l9YOs94KLfDt+sM=;
 b=maX1fJR459j9bTT/i/FcZluuRJjdtq45t9ua4H0lkFp2Fvu8AvbQWRaoneF4GAendq
 GGsgRy5RasAfnEje6j1sDASgB3suDqgvaKXKvOHPqG35uRffPpCagqEr3tFVfyYOXOF/
 Kq3UZF03LBdNOdM8qNvFlAdI6otpsInC+84EUBzJi34EM8FcQdk5cKkl0wWCEC/XSUOe
 e+BX2jzySgUEhjUc3lit2/Pj/8p/dS0y8IVUKLwkWDr43YNOFDjh325Fr5uHGOso3mkn
 ZkihBU8oefvkAd2bgl6jK3GLZUvmL29WrT+9t6rAvC44wC+Id4+sg/x0ZNGWL0qPpgY/
 +VpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WBZi/FWYMVw+6x0q1L6ySXMBwWz8l9YOs94KLfDt+sM=;
 b=K9s8EFzyOjVPKT5U9f972YeF+JP10nZrLpTxGAZyKknW+2jDh2XsYsKlIOIBUw5jzz
 /KVCanw4O48HEKHNfnw4pxPB/rmqT8EcFwk44TiTh9L5oDsz7xPElXELkY7c4p65NK2g
 FnoY2lMB/pVyrqeTtnAzYuQkkxPmD6YIflMJ6P9V4ZXSozjO0mkv8IgrtNNwd10hcA+8
 6YAK+eKmSNnCkxx7RddVGhcDy9p6B8JrgC4C8fslME+2p8il5C5gAycb7Z4Dk2Cmw4R5
 7HcjwNb7X9p/vX0BvQwN/Fa76k0SjiZMfJatVvqovw094iJVg8phL1DbuPCwd0sRYRMz
 lUAg==
X-Gm-Message-State: APjAAAUwTCGhe9Q27jxBwyin6Tt85lf7Z/hBkq6XLMee19jSTt23g46J
 JtW3g31OaA67skZ4LMXzghRMP4f8o5/2jI3NwAKAujC3
X-Google-Smtp-Source: APXvYqz8xsOtkV0Tm7m5AoyjAnnPZwbpq0fVDCw0AcnBfOy1aP/HBlFsrVX+y2EqHLqO/PlpIPBTliVBh7mh/LILCMU=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr12076182ljh.69.1564437313862; 
 Mon, 29 Jul 2019 14:55:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190726053959.2003-1-andrew@aj.id.au>
In-Reply-To: <20190726053959.2003-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 29 Jul 2019 23:55:02 +0200
Message-ID: <CACRpkdZVVgqdt=+YYEauChoxjqKk6=LNKzj-40u3CFLxJr0D7Q@mail.gmail.com>
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Corey Minyard <minyard@acm.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, xow@google.com, Arnd Bergmann <arnd@arndb.de>,
 chen.kenyy@inventec.com, anoo@us.ibm.com,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, yang.brianc.w@inventec.com,
 openipmi-developer@lists.sourceforge.net, a.filippov@yadro.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yao.yuan@linaro.org, Patrick Venture <venture@google.com>,
 Greg KH <gregkh@linuxfoundation.org>, sschaeck@cisco.com,
 haiyue.wang@linux.intel.com
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 26, 2019 at 7:40 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The aim of this series is to minimise/eliminate all the warnings from the
> ASPEED devicetrees. It mostly achieves its goal, as outlined below.

I suppose it will all be merged in  the Aspeed tree?
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

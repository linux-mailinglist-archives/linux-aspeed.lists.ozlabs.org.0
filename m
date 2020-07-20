Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7322256FD
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jul 2020 07:17:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B992w4pNTzDqcg
	for <lists+linux-aspeed@lfdr.de>; Mon, 20 Jul 2020 15:17:28 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::642;
 helo=mail-ej1-x642.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=ZX29C3B+; dkim-atps=neutral
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B992m4pgNzDqZb
 for <linux-aspeed@lists.ozlabs.org>; Mon, 20 Jul 2020 15:17:19 +1000 (AEST)
Received: by mail-ej1-x642.google.com with SMTP id lx13so16739371ejb.4
 for <linux-aspeed@lists.ozlabs.org>; Sun, 19 Jul 2020 22:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=llO+ezp5UKjLN/4gUejpSAhuVodWUX2y6389WRqS3iI=;
 b=ZX29C3B+wKSyXH6qh6h2OQMPBvc7mbMG5X/UR2UuQXvAgFOicmmaxwsCKGcCnxwKYe
 rXuQ5ux7nyoURyNOenbjNs20MnYYvt5zr7+kEHNf9KvFallYm1cDMWfRHAyBuCPIGIVf
 Fa8q1yS98mCPS11Xro+fNzIK0lhjFClox23i4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=llO+ezp5UKjLN/4gUejpSAhuVodWUX2y6389WRqS3iI=;
 b=SKZDezNKHdjaQyrjxCEp/nILQsCMz2qzs6odHj0AK/r5E2NbW/FPjuMdKUbVrrOZxf
 7Lsm6ZVVl4OKfZWlNaOe1vPJLHetiXHuDsMgCQ2SMgz54YDxy4Xs+FGK0CpsK1IypQmC
 jVS1OYbzgKhGBIbHXIIlZ5HyhzjWFM2s8+IgutLaVPh1zIIkbbV38Fv1N6rBBwEu3M7+
 t2PO97Sp1eyx772Xb8UJYzR4L8kIhNf9jYk9VDPk9gUAXKp7cfkuBgj8tZe8v37/mSwM
 dKWeTrcUk4emPsn/0XATXyXeWJ7WhYZfr/gs5ZXIMQCZhkW5PAToM8xrQJqWoerzW8nb
 N3EA==
X-Gm-Message-State: AOAM532ADijhlp/MGRI9VIPM6ZY2k/3FZjDdNORvL6Bfm9r10CYAS4X8
 vVF3DpjrEz1ACWQ0hVSRYH9GuOFhPLHKdDerCK4=
X-Google-Smtp-Source: ABdhPJxHbh0zsBjNwGBxeo6ofITTeEAy4QXJqem9C7oZ5JanrL5g4ZqyppdG1I4ujvUydlfaNgWLQ+TNQONWUwZtbG4=
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr17678183ejz.108.1595222235025; 
 Sun, 19 Jul 2020 22:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200719173447.60603-1-grandmaster@al2klimov.de>
In-Reply-To: <20200719173447.60603-1-grandmaster@al2klimov.de>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 20 Jul 2020 05:17:02 +0000
Message-ID: <CACPK8Xc_iwvRtUVjY8G8rS8UbZf6-Q6FTGaNweJXk06A=Y459Q@mail.gmail.com>
Subject: Re: [PATCH for v5.9] dt-bindings: aspeed-lpc: Replace HTTP links with
 HTTPS ones
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Andrew Jeffery <andrew@aj.id.au>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Lee Jones <lee.jones@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Sun, 19 Jul 2020 at 17:34, Alexander A. Klimov
<grandmaster@al2klimov.de> wrote:

> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index 86446074e206..4f3cf91b3b7f 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -35,9 +35,9 @@ Additionally the state of the LPC controller influences the pinmux
>  configuration, therefore the host portion of the controller is exposed as a
>  syscon as a means to arbitrate access.
>
> -[0] http://www.intel.com/design/chipsets/industry/25128901.pdf
> +[0] https://www.intel.com/design/chipsets/industry/25128901.pdf

This URL redirects to a landing page. We should update it to this:

https://www.intel.com/content/dam/www/program/design/us/en/documents/low-pin-count-interface-specification.pdf'

or this:

https://www.intel.com/content/www/us/en/design/technologies-and-topics/low-pin-count-interface-specification.html


>  [1] https://www.renesas.com/en-sg/doc/products/mpumcu/001/rej09b0078_h8s2168.pdf?key=7c88837454702128622bee53acbda8f4
> -[2] http://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf
> +[2] https://www.intel.com/content/dam/www/public/us/en/documents/product-briefs/ipmi-second-gen-interface-spec-v2-rev1-1.pdf

For this change:

Acked-by: Joel Stanley <joel@jms.id.au>

>  [3] https://en.wikipedia.org/wiki/Super_I/O
>
>  Required properties
> --
> 2.27.0
>

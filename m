Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6F23E5C51
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Aug 2021 15:54:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GkZFS1YwBz30FD
	for <lists+linux-aspeed@lfdr.de>; Tue, 10 Aug 2021 23:54:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=W8fomkKI;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::135;
 helo=mail-lf1-x135.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=W8fomkKI; dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GkZFK5CfBz2yZc
 for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Aug 2021 23:54:27 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id g13so41670264lfj.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 10 Aug 2021 06:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jwWuIJqiBzpe1+2G6GtRorjiBXRmpvLNd3Ic9h54t+Q=;
 b=W8fomkKIUYVT177erd3QXdCb9N+w4GU7xEHCTq5V+/pLfs4vtKwHrQWVUWoJUa0WKb
 yROIoySSTQNgzo/gwzIxqRF0R5bfQS+nDpd4VtEzC7ELr7a7smTBhEYmnBQS7iU28eFl
 6/XmILEUsrPbVSQo2USlm6N8PSX516JZiNcZJXsvUVhtLxfMxR0eLAOF6GrZr45uhpYA
 i7Yq+yxNWPQ9DzLISfpIM6HOHFoZYWG8HkNOCTHmLhZ4GupDBs4AmopLoCHgMdalRbIB
 DLdHvCypgf5HJo3jpK3W4lZxDXnfAGL3udivEZnwKrCtcdQJBxxszPhgqQXRt34MHJsX
 q8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jwWuIJqiBzpe1+2G6GtRorjiBXRmpvLNd3Ic9h54t+Q=;
 b=X6sLcAuByiU7CMfQlanRUlS0kcxkNIlz3DMLdtSHwVVMLvY9JBqE3awEKmfP28HViW
 aHgtWxDgeL3QH60vzZnrdoM2PCvZMWABTZayaJoD2I9o8lpJPrHs5jI/C/tNfaB4H3UI
 iK1LxTSeRznZgkISBp7Rz0/ALXAeBlYjwOGL8ck+LqE9zQeJ1AQDvlA7JvNoKmIs3Jdd
 azlnqEZrPvfY2wAOkyyii2ACPI9bAE0sIZilHmhaBALCFOTO+neN3CzUuKv6Pbu+w5v8
 XycmCUPMf/Ch8IbQuSdTLQPWwdj0sic0eQHFBsl9sBDZXz57NKIXIljje8b44urhLYU5
 bdNw==
X-Gm-Message-State: AOAM532OeAt1S2OLgMgAkOCrnyPAk9MFHbAagG73/2a5fhaiUFaeUmzh
 xy/uZw1xGgYdUVglf6cLc5hn/7MtbXojRJEJoLIFkQ==
X-Google-Smtp-Source: ABdhPJydL53OBU+42r6QKcJIZe4IlQ/SoqsP/bpkjgaMcCdQZB8nlKWRZ68tmLNyMtyFuqJpiUzbjuD8656QAXWk9KU=
X-Received: by 2002:ac2:4d0f:: with SMTP id r15mr21366821lfi.649.1628603662266; 
 Tue, 10 Aug 2021 06:54:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210723075858.376378-1-andrew@aj.id.au>
 <20210723075858.376378-5-andrew@aj.id.au>
In-Reply-To: <20210723075858.376378-5-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Aug 2021 15:54:11 +0200
Message-ID: <CACRpkdZm9C23aHTWs8DNX1RChSB4A-X0PoyW5wnH2XyQQeviag@mail.gmail.com>
Subject: Re: [RFC PATCH 4/6] leds: pca955x: Use pinctrl to map GPIOs to pins
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, Pavel Machek <pavel@ucw.cz>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, Jul 23, 2021 at 9:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> The leds-pca955x driver currently assumes that the GPIO numberspace and
> the pin numberspace are the same. This quickly falls apart with a
> devicetree binding such as the following:
(...)

Honestly I do not understand this patch. It seems to implement a pin
controller and using it in nonstandard ways.

If something implements the pin controller driver API it should be
used as such IMO, externally. This seems to be using it do relay
calls to itself which seems complicated, just invent something
locally in the driver in that case? No need to use pin control?

Can you explain why this LED driver needs to implement a pin
controller?

Yours,
Linus Walleij

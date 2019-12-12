Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2738911D111
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Dec 2019 16:34:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47YdBg32hSzDr3l
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Dec 2019 02:34:19 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="iKPEiMkK"; 
 dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47YdBS2KhVzDqD8
 for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Dec 2019 02:34:07 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id l18so2047028lfc.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Dec 2019 07:34:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=a3HoIlbnDsQ+bG9LL9JaGOgzii63aNDgW55yKpCip9Q=;
 b=iKPEiMkKQgBQ4g2yPLGxQjeGhMyleGCLknPgXerp//TZbCetjQRPk0GwMRD1WJWWh+
 nrTwHEIOkBB34TYXuOi9YObv2wC3fdH8p08IfQLU9LUXhNp1ObJACUNQryh4iw/iN7/J
 oCIvUcHOAR6nY3v4xCJEPkm5FKaOWK5fGZEvnN8WVIqtXw48XWCRpddOiN/OlQ2aRqgo
 6ZhVx6Nlt4upYgtta0Yyos1/+smXER5q20OgjRzSWGBMxYavvyZjdM+H5G9HKjXJvlBE
 OBVTQb3i0yF0Ljjqvd5Rt/U8xxg8LDV0m91fNszkUwKDKlVtlWupOQ9+ZvGmKAdeg7Cp
 //Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=a3HoIlbnDsQ+bG9LL9JaGOgzii63aNDgW55yKpCip9Q=;
 b=Lhj1/cEbcvhBayKVKipUKjC9IsSe8glL7FWV/g/KXDFLkfpChGYAgDzMNzNayV7ST8
 fgnHYtA7RM2yLaQrQ69vdWlHEM+GuLjZcdh0RFsm2SOV7/SZXCTKWkVgnHs2rEb+ul66
 4UA6V7vO7zOOEMFRS2oUEQ+3SSzYMBhNMwk4/dr49HKpjCTGJQ8YX5KpS0C1YGcyAL3+
 JlOkIOv9aSJwQR2kItsrM0H/gN489COJxx+SIJ3OMFBbEJwkpLtW3A50plnalMVuv2xB
 WnTvVlNoCkCcgFakaM7+HjlBQp/7g/VZPeDvh5jg627aX/XfFtSKi5EymA1F8mFkkLle
 Uh5Q==
X-Gm-Message-State: APjAAAVGO8L7+8Acj29QSA+waXwSAIE2mBnJoz7OtzR3wn/scpdxs8fO
 3b4NJtqAydF5K09JPWP6xdqQ5abr32aVEEj/NAjVAw==
X-Google-Smtp-Source: APXvYqxiy9bV88GGh0k1LLBojYnrA1fLF0F8FrE5iWdwSwTFvk+H0DElw5XdBSrCzUI8nlHvxA8+NcTHLRbEJpbUXLc=
X-Received: by 2002:a19:2389:: with SMTP id j131mr5789532lfj.86.1576164484490; 
 Thu, 12 Dec 2019 07:28:04 -0800 (PST)
MIME-Version: 1.0
References: <20191202050110.15340-1-andrew@aj.id.au>
In-Reply-To: <20191202050110.15340-1-andrew@aj.id.au>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Dec 2019 16:27:52 +0100
Message-ID: <CACRpkdaHXYdHOtCE=_e549rP5DpzP0ayOR4nJmq055Ftiorr-A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed-g6: Fix LPC/eSPI mux configuration
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
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Dec 2, 2019 at 5:59 AM Andrew Jeffery <andrew@aj.id.au> wrote:

> Early revisions of the AST2600 datasheet are conflicted about the state
> of the LPC/eSPI strapping bit (SCU510[6]). Conversations with ASPEED
> determined that the reference pinmux configuration tables were in error
> and the SCU documentation contained the correct configuration. Update
> the driver to reflect the state described in the SCU documentation.
>
> Fixes: 2eda1cdec49f ("pinctrl: aspeed: Add AST2600 pinmux support")
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied for fixes.

Yours,
Linus Walleij

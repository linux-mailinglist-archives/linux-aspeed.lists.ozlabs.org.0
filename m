Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB0A39395A
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 01:46:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Frkx72pj1z2yxn
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 09:46:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ku+MevdN;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12d;
 helo=mail-lf1-x12d.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ku+MevdN; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrkwZ0zlSz2yWQ
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 May 2021 09:46:03 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id f30so2657852lfj.1
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 16:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pzhAZz5qD9tMIBygAnX25ExGzRT83UA6SsM5Jk9PK9c=;
 b=ku+MevdNuxRQCIlQDe5WbthdcCPQDlxzodRhu4e04QT5ujq4MSRkOtpvYQW/yxHMuy
 f8M/4piku6X9w+HnbFpx3Laek/DEUtWRK5WXzuJxghvKoAN8b1NoWQRlhGfHvluUWD3I
 Zxo+KYHxKlMCru/TegYs6o7Wx1HC3HrsXqbOPlzPKezkluNtQhqrCVb9ewW+lVeON4aZ
 7BAasc7TxACThYfU8UpHTYw5znXA8c7O3yUAyqzfv/JSJJzPAZMOGrlFx+tVD6pyX/cW
 yUSCBW3S+B0M9XgiWX8isA12ea6Er/YDTkFGL4bEkXkwTv7cDHejONmAqsLBRkchgtBb
 rtEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pzhAZz5qD9tMIBygAnX25ExGzRT83UA6SsM5Jk9PK9c=;
 b=tQ1FeD/xYvSDOPAfmC2wNDl4tBfsaIydUWLQTNIx8MYKmuIFN/tJM1JurHVF67rJbd
 O5RKUIQzvZanKe5ZJyvzKbHLvWbhg1/hIH630C7mex5z3zapJVsekCdhZkpXleDCRm22
 zG6h/FOZL9ehjxc1j+TOf+XEnzPgRoEh8gr93C1wQo1kifKYMnhcVC5bztJ3Q4oyK/dp
 M8XoD0PkSKC/pfTNEhKSSpeMhRe35n/YZPUIatJK5sIQIVFo/2MVe3wV2iay0ZZE/cnL
 hFVVPOj/xxTojh371vSYZsS9xNM9htMrSCoZdQ2FVatTIITXsN2AZkNIqr4pmitoOZ+T
 k4Qg==
X-Gm-Message-State: AOAM531ixocBTE4Pl/6eRZuGkJGvYCGsSRtt75Jq1gEkB9uJK+xfE/P8
 ICatkReyiPzcH1x3cqKUG8g5PkADvhmuKzQOZyqduw==
X-Google-Smtp-Source: ABdhPJy/46H+k3aOEa5cM0efkOnNLslLyNp40ndo+HmC/hefCNnT9RC3XB9+Hy8ze9TKQNzaARS55qPRJF1ZogTpez8=
X-Received: by 2002:a05:6512:11ea:: with SMTP id
 p10mr3746839lfs.157.1622159156359; 
 Thu, 27 May 2021 16:45:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
 <20210525055308.31069-2-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-2-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 01:45:45 +0200
Message-ID: <CACRpkdaFVnGeOHCdwoBS4UMho8OJ_s6cAbkqJEM+uNyf9j=EQw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Update enum for adding SGPM2
 and SGPS2
To: Steven Lee <steven_lee@aspeedtech.com>
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
 "moderated list:ASPEED PINCTRL DRIVERS" <linux-aspeed@lists.ozlabs.org>,
 "moderated list:ASPEED PINCTRL DRIVERS" <openbmc@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:ASPEED PINCTRL DRIVERS" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Hongwei Zhang <Hongweiz@ami.com>,
 "moderated list:ARM/ASPEED MACHINE SUPPORT"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, May 25, 2021 at 7:53 AM Steven Lee <steven_lee@aspeedtech.com> wrote:

> AST2600 has 2 SGPIO master interfaces one with 128 pins and another one
> has 80 pins. It also supports 2 SGPIO slave interfaces.
> In the current bindings, there are only SGPM1 and SGPS1 defined in enum,
> SGPM2 and SGPS2 should also be added in the bindings.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

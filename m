Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EDB39395E
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 01:46:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrkxC0Rxfz2yYN
	for <lists+linux-aspeed@lfdr.de>; Fri, 28 May 2021 09:46:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=n0nnJj3x;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::230;
 helo=mail-lj1-x230.google.com; envelope-from=linus.walleij@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=n0nnJj3x; dkim-atps=neutral
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Frkx86fHdz2yR7
 for <linux-aspeed@lists.ozlabs.org>; Fri, 28 May 2021 09:46:36 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id w7so3015187lji.6
 for <linux-aspeed@lists.ozlabs.org>; Thu, 27 May 2021 16:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oUMq5gMakuTv+VxVCawBoEv0d6hHmUUnitcWr50QPbU=;
 b=n0nnJj3xNV7aoppJdcUWyqnujztsYmLvtUZZGXI8rspgnNsSoUcFFO2nRMYl4LngJR
 i35dmrfNWtbjLVeuNXKEtG96fCcdPE/CRCUGnRQ8dLyl1qfC9cqcErJeZ00Cs537VlJb
 nRBtj6x8BRASrwlvxGCXczuZvPyQ7+RIW3UbY+TVH6yCOPURf8Hfnx8J8gylc+BA/PIw
 mB4asa86kLk8SgBxCTIEINX/nlnGEKXEFSbkXwjSNC+R3mGDNNNIH1fL19ZzRiWYP7oo
 KswDkl4XlEJ7yMY90phpeO1w5UK9OzJ0rG9qotvVc0Dqhiw99s6e9RuZGdVzibJiMCvf
 tgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oUMq5gMakuTv+VxVCawBoEv0d6hHmUUnitcWr50QPbU=;
 b=JyizBDBLLti588/D7YWluBeK6sFsGhmUE5lvs+YNzZnwkwZe+Yb1piOhTcTKfSpV85
 r2NONWPGWmJDs47aIsEX1sTjZMpihjMnvjXr/WCaR+3pShRvQ9of96dkt8/SPoSbJKp/
 ltklRR+QxD/lwRtPrkXJ0kzrH5KZjQRDWMnVfpxHPm4h5VtBCE9UXOTd+T3DyEYglSf9
 fwgNFvjbpnrn4keWadPosZYC9NRO+IPFggTC1QRGeqH+Gij7xILBKAQOXcLALzjiV3A/
 37mScixhsvZTFrao40fcNOpmpHfOm8DZ/LfOG/hxPJCYQvZ5CYD8g7GzZcdgr4u2D7aG
 oWag==
X-Gm-Message-State: AOAM533tOddiswxUB7/EomaqKedLh+XbUxh0e3Syegeyfp1UjmbayVV+
 x3EZeTCZmfYq5kmGkSEBE4m/M3sVbLWYsMhBM0GHOQ==
X-Google-Smtp-Source: ABdhPJxmDdGYglPiAFXs4Eu7ptrL+GCuuFiVIJrOFzslyzTdz+YvWNKCStjMplLuqgpzYu5Swlu4HGv5Pt7x5GCAszY=
X-Received: by 2002:a2e:b805:: with SMTP id u5mr4620596ljo.74.1622159192598;
 Thu, 27 May 2021 16:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210525055308.31069-1-steven_lee@aspeedtech.com>
 <20210525055308.31069-4-steven_lee@aspeedtech.com>
In-Reply-To: <20210525055308.31069-4-steven_lee@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 01:46:21 +0200
Message-ID: <CACRpkdb90ruzyyz9xmKQRSB+cxZAn6t+bfjGahQio_kyk-5_Ug@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] pinctrl: pinctrl-aspeed-g6: Add sgpio pinctrl
 settings
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

> AST2600 supports 2 SGPIO master interfaces and 2 SGPIO slave interfaces.
> Current pinctrl driver only define the first sgpio master and slave
> interfaces.
> The second SGPIO master and slave interfaces should be added in
> pinctrl driver as well.
>
> Signed-off-by: Steven Lee <steven_lee@aspeedtech.com>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>

Patch applied to the pinctrl tree.

Yours,
Linus Walleij

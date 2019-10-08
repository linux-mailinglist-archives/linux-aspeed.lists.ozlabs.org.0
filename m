Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 637BFCF9FA
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 14:37:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ncLc3vvWzDqJ5
	for <lists+linux-aspeed@lfdr.de>; Tue,  8 Oct 2019 23:37:28 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::741; helo=mail-qk1-x741.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="hdoPfz7i"; 
 dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ncLP27DrzDqHv
 for <linux-aspeed@lists.ozlabs.org>; Tue,  8 Oct 2019 23:37:16 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id z67so16494419qkb.12
 for <linux-aspeed@lists.ozlabs.org>; Tue, 08 Oct 2019 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4v0d+1p/aArXJ2yOJRd5yNu1aMPL1BHOkAquOKCrLz0=;
 b=hdoPfz7i2ZAKAojYg3MCdn1h3u+bC0JsI4n7zh6dL6bVxNYeSc793Pmj5qltJe44fQ
 to9MLzW0F9Q2qJMBxS063xbPKegLPpoWtkY13KtO91GW7ABSL8Ijg3sD3+wEzdn3gUKl
 KdAuBnJ7Q4VRAthQ+JYQcg1M4uXtSRp5ZpLUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4v0d+1p/aArXJ2yOJRd5yNu1aMPL1BHOkAquOKCrLz0=;
 b=gR1c6RjEFMmh/zh5MuoF8/DWE6lm/CsfjQ9MXeFiHmrP1VZ0dY9D1YwxhojlzkQgbu
 P66olpuNfTFJv0h8QVKK8e7JwhptSBQqlOZFt6bQLm2vnfGxmFlOK43Dm/aAXDJsny92
 6F9atO85GgoAyfp9lKwA+hdGQ9vLpjKLOYdljBDicYvlJiGF+dlommKyMPC5/xQWLtKO
 9h+1n7O+DU4MO+/XCd/4aHSp3PpIVQg0mMvgbl+FMz8RpbdfoCtE6sj+kgYNo+vKeAGW
 2iCMIN0LORj85/zHMNb1s7x/jOHl1Oy7DenzaXgbYfxP+dmFtRckGIwLbA/etdDQwNtC
 BHNw==
X-Gm-Message-State: APjAAAV4TqHcgtpksZjdaswFRuvSK1LHaz5Ux0UCtpTsuty1HljXVZ5A
 m+n6Za/ZiGzWQRPXHJ4vM/RpJstGXhfT1hv/ueM=
X-Google-Smtp-Source: APXvYqwWnZfc72JvmcJyYRX4c70u9XGRpY6zMM0qiDyLh1kU7xYPHgtRMVXxvCmA/MGSrjXZ3fNWualilBMYFbbhMQE=
X-Received: by 2002:a37:4a54:: with SMTP id x81mr28628198qka.292.1570538232484; 
 Tue, 08 Oct 2019 05:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20191008113523.13601-1-andrew@aj.id.au>
 <20191008113523.13601-2-andrew@aj.id.au>
In-Reply-To: <20191008113523.13601-2-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Tue, 8 Oct 2019 12:37:00 +0000
Message-ID: <CACPK8Xf-f-r4S02GoxYdBYOJi5NGYMCOr6XGVza4vEGAsqzR9w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: Add AST2500 RMII RCLK definitions
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
 devicetree <devicetree@vger.kernel.org>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Tue, 8 Oct 2019 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The AST2500 has an explicit gate for the RMII RCLK for each of the two
> MACs.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  include/dt-bindings/clock/aspeed-clock.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/aspeed-clock.h b/include/dt-bindings/clock/aspeed-clock.h
> index f43738607d77..64e245fb113f 100644
> --- a/include/dt-bindings/clock/aspeed-clock.h
> +++ b/include/dt-bindings/clock/aspeed-clock.h
> @@ -39,6 +39,8 @@
>  #define ASPEED_CLK_BCLK                        33
>  #define ASPEED_CLK_MPLL                        34
>  #define ASPEED_CLK_24M                 35
> +#define ASPEED_CLK_GATE_MAC1RCLK       36
> +#define ASPEED_CLK_GATE_MAC2RCLK       37

Calling these ASPEED_CLK_GATE breaks the pattern the rest of the
driver has in using that name for the clocks that are registered as
struct aspeed_clk_gate clocks.

Do you think we should drop the GATE_ to match the existing clocks?


>
>  #define ASPEED_RESET_XDMA              0
>  #define ASPEED_RESET_MCTP              1
> --
> 2.20.1
>

Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3991A5A3197
	for <lists+linux-aspeed@lfdr.de>; Fri, 26 Aug 2022 23:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MDtxC0Xk1z3bmL
	for <lists+linux-aspeed@lfdr.de>; Sat, 27 Aug 2022 07:57:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=moD9pQtx;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=moD9pQtx;
	dkim-atps=neutral
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MDtwQ6dHTz3bZ2
	for <linux-aspeed@lists.ozlabs.org>; Sat, 27 Aug 2022 07:57:08 +1000 (AEST)
Received: by mail-ed1-x52a.google.com with SMTP id 2so3667493edx.2
        for <linux-aspeed@lists.ozlabs.org>; Fri, 26 Aug 2022 14:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=7vSzq6vPLrHqcoL8kcBtL8IovIzvXBgbRpb5JcrKApM=;
        b=moD9pQtx2O8r/SMz3TXxlBEi6KM9LgOC/ExNEn/UpOh3/xg9gjjL/q5qvVceD+Pq+F
         PG3XnQ6yHlAjGW0PnFMz0HF1+mX47v57RzuS2BtND06yp1HfczNjdLBMQlwDzp+bRjsA
         TASLAwZIVTf2U/2FAdX44MlbxZDJ2wDOUBJHy7DuzqDVf36PCIpQDPUf54i6ccD02WF8
         RPwSSewXbllRYpN5H+yEiykQi5S4mSmVJBXQxxlXkWWzxkffmb8Y/PBAWQXmtS2e3prL
         Wlu5H/+Imia8y+VMjYkvyQOBWXC5+LZLxMkyQ3NGcQrNjdTvnFXlfmQNHG4vUu1iHB6n
         pBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=7vSzq6vPLrHqcoL8kcBtL8IovIzvXBgbRpb5JcrKApM=;
        b=yQocFeF0pxVmE9sK3j051Mkt0xfAlcgvz50zZC2sFlxzOGlTdw4Do8g9u0zq1Ho3z3
         45egKvzrSjl3P3lCtKJrmUj5mRN2CoRBAy1pqgzvobI3+F7p+6kdB69bn1Az5P4glnGM
         ulo8NJHTe2JhDvaX2XH+kZmIwCeukzjTIuI1EOAyTBJd+1GVLt0SkrnLF0T/3EKVjjx6
         +hO6FnVmU2MVtTqswyhq2s7SIOiEvDXfiM6QsBarNDsNMSTfNyFPP23O1oMgkONsVskN
         uq2qf87sTOu8JF4rZmg7iDPoa3bVp7zjHjXPMHqzqjSrzxdaalkh8fxfTETg7lpWypPc
         EvfQ==
X-Gm-Message-State: ACgBeo0WUxdoE8HCwNpaslgIhFe7z3mnLWLWiVXAjxYZSel0DY9iJ37/
	eDk7IOLJhbr8dHUCnnGjgiYR8r7H6CBGt2jn32rePA==
X-Google-Smtp-Source: AA6agR7/sF+zC9EW31AKq/oYtanUhvn4sbw0O7Ai7ueTmh8pIaXiX3lkjMjogncYyYdmjrCur7/uosW9qLsMkiUy3A4=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr8196109edb.133.1661551022135; Fri, 26
 Aug 2022 14:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
In-Reply-To: <20220818101839.28860-1-billy_tsai@aspeedtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 23:56:50 +0200
Message-ID: <CACRpkdYpp_1JJQmuX27pECxN0cjzciCuETLPTrSYKqpX0FPABQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: aspeed: Force to disable the function's signal
To: Billy Tsai <billy_tsai@aspeedtech.com>
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
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, Aug 18, 2022 at 12:18 PM Billy Tsai <billy_tsai@aspeedtech.com> wrote:

> When the driver want to disable the signal of the function, it doesn't
> need to query the state of the mux function's signal on a pin. The
> condition below will miss the disable of the signal:
> Ball | Default | P0 Signal | P0 Expression               | Other
> -----+---------+-----------+-----------------------------+----------
>  E21   GPIOG0    SD2CLK      SCU4B4[16]=1 & SCU450[1]=1    GPIOG0
> -----+---------+-----------+-----------------------------+----------
>  B22   GPIOG1    SD2CMD      SCU4B4[17]=1 & SCU450[1]=1    GPIOG1
> -----+---------+-----------+-----------------------------+----------
> Assume the register status like below:
> SCU4B4[16] == 1 & SCU4B4[17] == 1 & SCU450[1]==1
> After the driver set the Ball E21 to the GPIOG0:
> SCU4B4[16] == 0 & SCU4B4[17] == 1 & SCU450[1]==0
> When the driver want to set the Ball B22 to the GPIOG1, the condition of
> the SD2CMD will be false causing SCU4B4[17] not to be cleared.
>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

I can't see the verdict for this patch? Will there be a new
version, or are we in the middle of a discussion?
I'd really like Andrew's ACK on the result before merging.

Yours,
Linus Walleij

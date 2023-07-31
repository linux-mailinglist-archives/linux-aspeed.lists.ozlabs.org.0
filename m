Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A621C768AC4
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Jul 2023 06:21:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kBU1Q1S3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RDlSD433sz2ytV
	for <lists+linux-aspeed@lfdr.de>; Mon, 31 Jul 2023 14:21:48 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=kBU1Q1S3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=joel.stan@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RDlS11jxwz2yDd;
	Mon, 31 Jul 2023 14:21:36 +1000 (AEST)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-51e28cac164so10976758a12.1;
        Sun, 30 Jul 2023 21:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1690777289; x=1691382089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZitA7g4lEq5HSSYsaRmgk4c652yJOHd1UWJHaP9uzJ0=;
        b=kBU1Q1S3kp6WRiIFnBiqesOP3oNfzY4PjpVactBA8fweY9YQU9rWYcW+Z0fdUsCfWP
         vDdE6k+zrNA1y/f+A2Xf6XFtLNB9g1Qw5cKfWPuKta+ngFqZJYFyH8NT896Dv9xKD9fd
         jXhw5Hv4ZyCoyYuLYKA65QT/FyEJ7WPFWoIm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690777289; x=1691382089;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZitA7g4lEq5HSSYsaRmgk4c652yJOHd1UWJHaP9uzJ0=;
        b=jv16RopolpzY83wGHOsCLMmzhZa996QPNcg+vOMZJnny1hHr2ZumfN4aAWbqo5AQoR
         GbsqQAEelI6uBqImT9B8LlLKAF2Sy3sJbnhaWzTYfd+AvNCVAFrlDs9VAkrkyScHky4b
         zUHHHwVfbwQTOxkuH7+s2UiVXJItmB4AtxuIW7c56BFYgvKYqe2Dq/ergOt6snVy7RtR
         2n2TSFQ464ADCJbBPopswQWY2wyPETaPIZPthm7ZxpPJZ8YKwwwX2DOAKB6cryvCheHy
         muWaPgh4XieftkyyYUoGyYBSjkn+bERPKwJQQAebxgU0P4Hxu4Dwj43TRkSueOYhVrG5
         aBZw==
X-Gm-Message-State: ABy/qLb1lBQueKnt7ZmpAsX4kHsj5dMW3GtiDbOVLnidm4MJBXo0/ILL
	5M97IYJWNxkrxns5ZG4yOzDGWkVekZt+jbW56xY=
X-Google-Smtp-Source: APBJJlFDgZxAn8Q4AK+y0YmkDiz7Rn+hJjCg5hDfnEtGL7P5vUgksBmup3Ptzk+0W/Ntq2y52aZUAHLFf/CgJEV8f+E=
X-Received: by 2002:a17:907:728d:b0:99b:dd23:4f01 with SMTP id
 dt13-20020a170907728d00b0099bdd234f01mr6491075ejc.33.1690777289031; Sun, 30
 Jul 2023 21:21:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230728122416.17782-1-lianglixuehao@126.com>
In-Reply-To: <20230728122416.17782-1-lianglixuehao@126.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 31 Jul 2023 04:21:18 +0000
Message-ID: <CACPK8Xf6YssamEmHB5XDf8JYk+_=hnG8Yzqn4kCikseqg6rqOA@mail.gmail.com>
Subject: Re: [PATCH] i2c: aspeed: Avoid accessing freed buffers during i2c transfers.
To: Lixue Liang <lianglixuehao@126.com>, Eddie James <eajames@linux.ibm.com>
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
Cc: Lixue Liang <lianglixue@greatwall.com.cn>, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, brendan.higgins@linux.dev, linux-i2c@vger.kernel.org, p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Fri, 28 Jul 2023 at 12:40, Lixue Liang <lianglixuehao@126.com> wrote:
>
> From: Lixue Liang <lianglixue@greatwall.com.cn>
>
> After waiting for the transmission timeout, the I2C controller will
> continue to transmit data when the bus is idle. Clearing bus->msg will
> avoid kernel panic when accessing the freed msg->buf in
> aspeed_i2c_master_irq.
>
> Signed-off-by: Lixue Liang <lianglixue@greatwall.com.cn>
> ---
>  drivers/i2c/busses/i2c-aspeed.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 2e5acfeb76c8..c83057497e26 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -713,6 +713,8 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>                 spin_lock_irqsave(&bus->lock, flags);
>                 if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>                         bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
> +
> +               bus->msgs = NULL;

Eddie, is this the same issue you were debugging?

>                 spin_unlock_irqrestore(&bus->lock, flags);
>
>                 return -ETIMEDOUT;
> --
> 2.27.0
>

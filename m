Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C60D3481
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 01:43:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q72J1LZpzDqQc
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 10:43:36 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="g27litSg"; 
 dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q72C0VSXzDqQS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:43:30 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id c21so11261226qtj.12
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 16:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+99LfkE0Ayp8m1IDOU4Gz0njgEWkjVrScr5OXbe0ExY=;
 b=g27litSgnBG1fH5c8FdwvHHIU8jfoU7WkY4210zjf7prULOHqvPkg0y/kFCN8MqBrk
 eur+7x4q+axYsgRyrUBbB0PxrTYmKzpr6/MYZgdhNheCn4BlgugL5Xhr3XOqMfgGTvf+
 eqBcOiU1wVTRLrXdkllD4uDaYSWfaFJN1F7WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+99LfkE0Ayp8m1IDOU4Gz0njgEWkjVrScr5OXbe0ExY=;
 b=brfD1/9e6adzMzU8PPhemIOQYthgWHOOu9Jax1ZQ06QHYQfv9vAmt7DOjJ/b7I4mxM
 Ft3fkbZv7Nc8h8unE1FIjHQlTZp4aao/rBwFaqcd20HExlnmIark6QEYENTsd0Uq8ZhC
 R/yt2Ib4KUBVVGT2/wGnpMm+6MzEXTPQ9/0ESGGB2QHfBnYAHprpcA5CTSKnFokXCzqs
 J3HfpnXv/sFHYbgznf9teyIM5PfODBEtKchx/FAsqQ18sYbsdy9hGF7wG7vzevhrVJFu
 kLAbpzOAsGeKiwqTkfswUrICzEZeRA9seCkf32jctT8cwL2c+/T3XQh1WO8PsGzzE0pu
 MliQ==
X-Gm-Message-State: APjAAAXl9CPtsoL2tFOmiyOujeqKB/0yw9f2++S8SPTng6k91TUiXA15
 eyTMF5cf8geCJPd7YkeKh2hWq5YsBNnd43RlvIs=
X-Google-Smtp-Source: APXvYqyKAUsDXXorfPQ38wIFUSbSjZKAetsJg1J3PqJn6MQDhqsbpGCV86yHgGv+eMYgGt6cxc2ZBkuC/GpIyIcn7pc=
X-Received: by 2002:a0c:f702:: with SMTP id w2mr12680741qvn.111.1570751007441; 
 Thu, 10 Oct 2019 16:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191010020725.3990-1-andrew@aj.id.au>
 <20191010020725.3990-3-andrew@aj.id.au>
In-Reply-To: <20191010020725.3990-3-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 23:43:15 +0000
Message-ID: <CACPK8XcfNWkv+iiR8xFfDV6puvRpJUAsSMeX0rPe15+N_X75Bg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: ast2600: Add RMII RCLK gates for all four MACs
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

On Thu, 10 Oct 2019 at 02:06, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> RCLK is a fixed 50MHz clock derived from HPLL/HCLK that is described by a
> single gate for each MAC.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

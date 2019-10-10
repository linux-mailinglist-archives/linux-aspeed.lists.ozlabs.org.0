Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE89D3486
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 01:44:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46q73G26J1zDqS3
	for <lists+linux-aspeed@lfdr.de>; Fri, 11 Oct 2019 10:44:26 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.b="X0eH7IQQ"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46q7390MpHzDqQS
 for <linux-aspeed@lists.ozlabs.org>; Fri, 11 Oct 2019 10:44:20 +1100 (AEDT)
Received: by mail-qt1-x842.google.com with SMTP id u40so11262367qth.11
 for <linux-aspeed@lists.ozlabs.org>; Thu, 10 Oct 2019 16:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rcSn1vCJbuxn3bYcrpBbek84j13SuRZ8wCxvhMSzcKo=;
 b=X0eH7IQQtXwjhM8QAXI8Ra3VlUekFB08JwxVQoYgInpA6gxOxngSdH+5N97FE6Hydm
 L5Xszn63Ia83PwIrCpYoelxUL7RkSA+KGzefkV6FaTOKEEsvaKrQBRA7ka7KOg5sjqjO
 mnwXYklMvyUMK5/T7JvVAPTct+Jshn/6w+J1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rcSn1vCJbuxn3bYcrpBbek84j13SuRZ8wCxvhMSzcKo=;
 b=YWNXnqjSanU/pCg+/1cVmG9Xph0O24cWs6sSuBKI3bViqIVGfwUc49fk30BtFLEEis
 GT3Z7u2rii/0DagSYXU0RGHSfOjxYD0XefWejVYiy6TG0hhX7n5r7h3GNrYa2vhXe2OG
 UUDa7K8ySlhg2eXfaYFHkvT9HANuddDTXae8ewD25pBI+3qHr25FRcfKBcYfBuid1zmd
 bAafjyskME1cRNO8ZAOnRF9gtPCbIzNvdPRrzR3hNRrJyjzvYuUO53vTN4iyLRd/DmEC
 7yrGs+5Yt5CQOtFBhM8/tD2OPQQpeNw8ZfvMsufPQjBV9kSZFRG1S/UkP6FSpPCk58ON
 FL3g==
X-Gm-Message-State: APjAAAV8lZhMjxdqBrzFlTl3A4LAmR19dqm0/wnGvIci6BTRzSLnLuth
 BCTRfiNjaDTT77o7fKCEJTnB62DxlX+3FhotFVqSIiouCYM=
X-Google-Smtp-Source: APXvYqz0x1K+tlIiXgdr6o6qeGgBTJHPWg6le+hqBBQerv2MEmycmhWnHoMRBnpQ/FKEHxEfxoyzlX9H93uXVTfrgL4=
X-Received: by 2002:ac8:2e65:: with SMTP id s34mr13649429qta.169.1570751058435; 
 Thu, 10 Oct 2019 16:44:18 -0700 (PDT)
MIME-Version: 1.0
References: <20191010020756.4198-1-andrew@aj.id.au>
 <20191010020756.4198-4-andrew@aj.id.au>
In-Reply-To: <20191010020756.4198-4-andrew@aj.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 10 Oct 2019 23:44:06 +0000
Message-ID: <CACPK8Xf8rEwCiDe1b+FgHQPscJYXuwKFzfrP1vmFeYde=uawyA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] net: ftgmac100: Ungate RCLK for RMII on ASPEED MACs
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
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Thu, 10 Oct 2019 at 02:07, Andrew Jeffery <andrew@aj.id.au> wrote:
>
> The 50MHz RCLK has to be enabled before the RMII interface will function.
>
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>

Reviewed-by: Joel Stanley <joel@jms.id.au>

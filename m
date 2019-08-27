Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D079F0B3
	for <lists+linux-aspeed@lfdr.de>; Tue, 27 Aug 2019 18:50:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HvxX0rMfzDqvh
	for <lists+linux-aspeed@lfdr.de>; Wed, 28 Aug 2019 02:50:08 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HvxK6jgkzDqt3
 for <linux-aspeed@lists.ozlabs.org>; Wed, 28 Aug 2019 02:49:55 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id l2so15508459oil.0
 for <linux-aspeed@lists.ozlabs.org>; Tue, 27 Aug 2019 09:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7MPppvQzuTQRt9BznXwjvzO0Ebod4s5AerzRU45JZms=;
 b=Sv99+EwpLgR0MdwwUmwAjnhPFGFIqwoJhfR0NMF3UK4j+GMk8wqAoVEcCzPgjuGrUG
 pYlEMspb46CRdwQ49bmepcVu0NBjk3UoVUdwNuERG8x9HUf4Ihh+4tnOGc2tKHl2Cuo5
 c9LDaVA31B4jv0b3TYae4sSKYlBNHVpZVa+P1cvFjGUriZdcvmYkUJr8HmsO3lZCtoRo
 JA4/4Kjhy4BmJAUnKGtqtgb9DFdIba+K5Y0HKBqEDOsCRqArkEYhj0GIz9ZlKwpUiTBW
 1D3IF+g0jc7GMwIK+btb7vg+NwG089/GgUKKX3fU6+rKWm0iBM5aDokCafU+uym9OhsF
 G5cA==
X-Gm-Message-State: APjAAAV+cXmkD/kdeZ1GWQ2iv//h+KVLWZdZ/ls9C12OzMIkXmDISvfQ
 eCC7Qkekqxi4JtsrYH6UAA==
X-Google-Smtp-Source: APXvYqxdvM5S16bwNgKtmD/8gpKaMVejRbwknzUDZRxkGiPYP4MSJdQYjH2zGFN+sh6d3qXNd4ffoQ==
X-Received: by 2002:aca:ec87:: with SMTP id k129mr16354304oih.80.1566924593136; 
 Tue, 27 Aug 2019 09:49:53 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f21sm5435626otq.7.2019.08.27.09.49.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 09:49:52 -0700 (PDT)
Date: Tue, 27 Aug 2019 11:49:52 -0500
From: Rob Herring <robh@kernel.org>
To: Joel Stanley <joel@jms.id.au>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: Add ast2600 compatible
Message-ID: <20190827164952.GA24417@bogus>
References: <20190819051738.17370-1-joel@jms.id.au>
 <20190819051738.17370-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819051738.17370-2-joel@jms.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, 19 Aug 2019 14:47:37 +0930, Joel Stanley wrote:
> This adds a compatible for the ast2600, a new ASPEED SoC.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> ---
> v2:
>  - Add Andrew's r-b
> ---
>  Documentation/devicetree/bindings/watchdog/aspeed-wdt.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

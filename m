Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EE40798003
	for <lists+linux-aspeed@lfdr.de>; Wed, 21 Aug 2019 18:25:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DCgc35NQzDrBq
	for <lists+linux-aspeed@lfdr.de>; Thu, 22 Aug 2019 02:25:16 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh+dt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="AXjn2grX"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DCdf4tmqzDr7p
 for <linux-aspeed@lists.ozlabs.org>; Thu, 22 Aug 2019 02:23:33 +1000 (AEST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D06EE233A0
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 16:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566404611;
 bh=Fu6zfOBX3AI5KWtTSZafuQQAF8bGSK3gF/is0kKpuAY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AXjn2grXFCsNM5ogWIBC9CJ944d8x37WSc5awe9xY4q9jQ5I6RniduJ7ZIt616ghp
 F/IahXeBcOikhI+DQxT2zSObjNYowY9iIXaDUbwLLeU3XCDad0XXrzFufvsCbYe6Dz
 2IGF/YNzK1dAuVvz8d0rrsKykq3RvrTk2LmYucBQ=
Received: by mail-qk1-f181.google.com with SMTP id s145so2335825qke.7
 for <linux-aspeed@lists.ozlabs.org>; Wed, 21 Aug 2019 09:23:30 -0700 (PDT)
X-Gm-Message-State: APjAAAXFZ9ZJBABQPovt1jPOcxmcjrPrKzC+PQ69l9HrmEHMYG/BUYPT
 M77idW8MlZ9NPtYTnXCNNxwJoK3nxbpmgmwRww==
X-Google-Smtp-Source: APXvYqx7jliLwl32fZb5QjZU335HexP3hY8IwcnBzHIqSH45RRHoAYAe7+oJIjM94Ra+S4ayKwHMV4e1XUsgY6mOtIk=
X-Received: by 2002:a37:d8f:: with SMTP id 137mr31383435qkn.254.1566404610034; 
 Wed, 21 Aug 2019 09:23:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190821055530.8720-1-joel@jms.id.au>
 <20190821055530.8720-2-joel@jms.id.au>
In-Reply-To: <20190821055530.8720-2-joel@jms.id.au>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 21 Aug 2019 11:23:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKXUsBdZ3x+zsJdn-2yLEJSCvLFjtUdRzUwU1vi6iiHfQ@mail.gmail.com>
Message-ID: <CAL_JsqKXUsBdZ3x+zsJdn-2yLEJSCvLFjtUdRzUwU1vi6iiHfQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: arm: cpus: Add ASPEED SMP
To: Joel Stanley <joel@jms.id.au>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, Aug 21, 2019 at 12:55 AM Joel Stanley <joel@jms.id.au> wrote:
>
> The AST2600 SoC contains two CPUs and requires the operating system to
> bring the second one out of firmware.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  Documentation/devicetree/bindings/arm/cpus.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring <robh@kernel.org>

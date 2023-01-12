Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6EC6686B0
	for <lists+linux-aspeed@lfdr.de>; Thu, 12 Jan 2023 23:17:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NtJp74P9vz3c5D
	for <lists+linux-aspeed@lfdr.de>; Fri, 13 Jan 2023 09:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=esi4sIDL;
	dkim-atps=neutral
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=esi4sIDL;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NtJnz3PG8z3bTm
	for <linux-aspeed@lists.ozlabs.org>; Fri, 13 Jan 2023 09:17:40 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id o8-20020a17090a9f8800b00223de0364beso25062898pjp.4
        for <linux-aspeed@lists.ozlabs.org>; Thu, 12 Jan 2023 14:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=duA6Un7MMHsWwDUG6Y+g/Vg750sAKeltAfxhDAJWOzI=;
        b=esi4sIDLgCeEJk+u0yjNbzcOwnXIyrdFqNgIf/C/hPkZydzpXkwVQAN68jczLwo5Vy
         DjaWv1FKrmoOVsI/0IYwX7hEP8bcbjLX9gMOv2qJZ01Sb6xTbGwFMOr7weCr1vnx3hO8
         JxqhFjo+y4XHo7VkWAHe0Pp4x16s1XVBDAvHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duA6Un7MMHsWwDUG6Y+g/Vg750sAKeltAfxhDAJWOzI=;
        b=z64ylTgU8cKvU6u4cZDp2L+IwLXujW+CoNFnzLLiqpX8b7wlIbmScKfW5B9yBOJ521
         1GMGrtaYcxl9HOS+ob949drmq4HB9tHadwhalyRnwxKM/xjXo2i39KpirgVGZajdncE8
         y+9o2RogYCyxKwZeTQ6bkrBTzVABcfI4dzAtY2rJASxx4NUE8Tkz4/Gn9kVRJCqUyWiD
         oiZvX8gZK2n2OfNoicj1eQ/9Lb63kcOTdlu4kGSdn2uHtKv9UyTXBl9MZmxNN+8G1KD0
         77JwYkDYgTcsrH3CLDOwsGNKtwWbRCXLKRPQNFjD//AMRPVBHyvp/P6vIq7PrCHHT2Xu
         QMBQ==
X-Gm-Message-State: AFqh2kr3MDD/jdOqUcyOF7hnRFVXEQ3sXp8c5+11w+X84boTJyY4z2ko
	J0c32q1CaKLr2KFjfZB1ZoU3pQ==
X-Google-Smtp-Source: AMrXdXu4y1USXbmB33jWp7T1TGYvEnF6MOtrQLu8xzf4Ek5Cp8Os7yBkCc4yDy30ibdWeK8h+3oGNQ==
X-Received: by 2002:a17:902:9685:b0:192:f5a8:3099 with SMTP id n5-20020a170902968500b00192f5a83099mr26592237plp.5.1673561857844;
        Thu, 12 Jan 2023 14:17:37 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z9-20020a170903018900b00189db296776sm12808100plg.17.2023.01.12.14.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 14:17:37 -0800 (PST)
Date: Thu, 12 Jan 2023 14:17:36 -0800
From: Kees Cook <keescook@chromium.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH][next] crypto: aspeed - Replace zero-length array with
 flexible-array member
Message-ID: <202301121417.EE86BDD5C@keescook>
References: <Y7zBxbEAvcEEJRie@work>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7zBxbEAvcEEJRie@work>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-aspeed@lists.ozlabs.org, Neal Liu <neal_liu@aspeedtech.com>, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Mon, Jan 09, 2023 at 07:39:17PM -0600, Gustavo A. R. Silva wrote:
> Zero-length arrays are deprecated[1] and we are moving towards
> adopting C99 flexible-array members instead. So, replace zero-length
> array declaration in struct aspeed_sham_ctx with flex-array
> member.
> 
> This helps with the ongoing efforts to tighten the FORTIFY_SOURCE
> routines on memcpy() and help us make progress towards globally
> enabling -fstrict-flex-arrays=3 [2].
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays [1]
> Link: https://gcc.gnu.org/pipermail/gcc-patches/2022-October/602902.html [2]
> Link: https://github.com/KSPP/linux/issues/78
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

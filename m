Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9723D470C6E
	for <lists+linux-aspeed@lfdr.de>; Fri, 10 Dec 2021 22:19:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9kL33gz8z3c8g
	for <lists+linux-aspeed@lfdr.de>; Sat, 11 Dec 2021 08:19:07 +1100 (AEDT)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9kKx5rX8z2xvy
 for <linux-aspeed@lists.ozlabs.org>; Sat, 11 Dec 2021 08:18:59 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id
 r10-20020a056830080a00b0055c8fd2cebdso10899517ots.6
 for <linux-aspeed@lists.ozlabs.org>; Fri, 10 Dec 2021 13:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Our/pN1IyVCtIS8mIewFtFMewda+bHas4rs49FN0p6s=;
 b=13VeojzkoDrp4sAZ4yEzsa9LKNkLIHColjmpft/O5XPOo2O4YO2+V6In0MZVaYT0LB
 ky6X+DIadIFNc0MRYttJVqV+YDNw23/MtKwFbX+ul9VkZujhfR+oh8Cblp0yH0EQzbqx
 w98ZNqrJ0U4G3w31mVbmQ08vM2pd8Wr0BYbkmNL3VVAvAA80hLVTA5sxyP6noAybvX9h
 B6Rwd9UbeStj/wwfJwz8BHIg7ZqHkZWnmUFGGmP064IKm1S4cxbQefK0TTNx4pIAH/jS
 zWIE2Z3GAyTc2HoHlZqurbOfz/b4fDVavcCoV2/102iwWp+NGTM/Q6EP+GYMzNoEYjiy
 04rA==
X-Gm-Message-State: AOAM530C7ialncihQtI9bMMTkOSHxNkjb4ceEhJu/fmjLywfBBGWdHct
 jxvIFuavAz3CzeeQaYsfzQ==
X-Google-Smtp-Source: ABdhPJyHmK8KkTYDC8dC39vS4BDv14WHjiA1TtUa3WbDo5zSxnrrirNWYG/gK9DPHglZ1YKjtd2FmQ==
X-Received: by 2002:a9d:1e1:: with SMTP id e88mr12745468ote.75.1639171137206; 
 Fri, 10 Dec 2021 13:18:57 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id x16sm741453otq.47.2021.12.10.13.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 13:18:56 -0800 (PST)
Received: (nullmailer pid 1916612 invoked by uid 1000);
 Fri, 10 Dec 2021 21:18:55 -0000
Date: Fri, 10 Dec 2021 15:18:55 -0600
From: Rob Herring <robh@kernel.org>
To: Tommy Haung <tommy_huang@aspeedtech.com>
Subject: Re: [PATCH v5 7/7] dt-bindings:ast2600-clock Add CRT reset define
Message-ID: <YbPEP9VoYdDWitez@robh.at.kernel.org>
References: <20211208013337.13806-1-tommy_huang@aspeedtech.com>
 <20211208013337.13806-8-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208013337.13806-8-tommy_huang@aspeedtech.com>
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
 BMC-SW@aspeedtech.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, daniel@ffwll.ch,
 linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed"
 <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

On Wed, 08 Dec 2021 09:33:37 +0800, Tommy Haung wrote:
> Add new CRT reset define for ast2600.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Tommy Haung <tommy_huang@aspeedtech.com>
> ---
>  include/dt-bindings/clock/ast2600-clock.h | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

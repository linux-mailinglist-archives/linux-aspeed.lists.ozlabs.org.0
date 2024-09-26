Return-Path: <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linux-aspeed@lfdr.de
Delivered-To: lists+linux-aspeed@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5833986D12
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 08:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkvJ69SXz2yvn
	for <lists+linux-aspeed@lfdr.de>; Thu, 26 Sep 2024 16:58:04 +1000 (AEST)
X-Original-To: linux-aspeed@lists.ozlabs.org
Delivered-To: linux-aspeed@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333883;
	cv=none; b=D50B8gllJh9K9Hf7hQiRiQ9q4BZ7YQ9M+luSqu3N0HXikKuPJaD8kINR/WY/mCRC5wLiBjKvxW+M843BVctSKh8l56VENzPqUnnoVbZI7ZxNnXRktFYL6rhzGHxB4YAAaqEFO4BSzQCd9A3ls7MnjgGp36giPKoS+6wGa2Tg41dpmR4/LyadWZLNEbx2L+W/KaeRZ0UvWQNdobVTgFxrJR9RIFVlBBdH9KnPAmofjrkaV47YUGzdEOvXbMShzYXjpTAejVpSsUn09iV5PZFIP8014csNdtD+7zB7XCJjJoNTu9Bba1WEV3592CzBCmcD5aZYf0lWK+uGOAzgNC+/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333883; c=relaxed/relaxed;
	bh=PBWIbI7jE7sd+RW3Qy02QvuEF2BGI4JVfTAMtYHNXps=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=V/iBqPkmuSoqxIdsDqfcgs1N2igtE0XK5ekzOlSc0+ah4O3NFD0dfkILc+PDSR6DI7qPEtBwfmNCBaLm8ij8L1yfESAWic4XzfUbJRQaZz7k+cZC2q879CQEg/Ax4zxXjx1fuRqE3ZdXuYrhozFsgt5P53pV7klINsL3IOpZ3OXJlHSZO9Tig3bzMHN+jIlECLp5svXc1HZRfuhi9ABUmJN5w1ba8bOqzzGCSq0bPCufEwFw1rru8KL+38zpDTxa1mmDSJW9DcdPgBthVZJ+doIFxNyRht26ENPi7CsDmukwDf0Lz4C7mRcBaoPmzK1hxNtNn86BPIQtr1xb6WrzrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J+OYMHIg; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J+OYMHIg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=potin.lai.pt@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkvG3Nf5z2yVt
	for <linux-aspeed@lists.ozlabs.org>; Thu, 26 Sep 2024 16:58:01 +1000 (AEST)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3e04801bb65so460224b6e.0
        for <linux-aspeed@lists.ozlabs.org>; Wed, 25 Sep 2024 23:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727333878; x=1727938678; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PBWIbI7jE7sd+RW3Qy02QvuEF2BGI4JVfTAMtYHNXps=;
        b=J+OYMHIgI6RxldqlaRnRvVjoy8OI5XNR1M8cGJs/7JYsS79/VkkIFrgDr/u32yhkcN
         uV/Sp5lFjjK8mwDN4bq7RHVF4G1QTEaqy31FVNCXKuF6d6Yd0nGJCEyrrr7Dh21VvxSM
         SSd3d5B8kZSUVv5eRKgXqNqBeWjh6NnOUyDVLDKNU6t8q0GeRUvtAxJnQvxWqzYysF43
         TS2PGkK1qVRhcD6ywk1VwuVOgervnX0yVz8MC9tQ1vG4UlL5iMw1ZbfBo7fgDEu7cY+q
         aK3merPZVzcKY2wGXfFV5HZ+jkpSFFXyVtDMKE28SZRrnii5xZxwBR60oiuRvAs7ljre
         RD6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333878; x=1727938678;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBWIbI7jE7sd+RW3Qy02QvuEF2BGI4JVfTAMtYHNXps=;
        b=qFtAsx/HuZQlbBvoEuo9i7UjtVBg0gGVXwRgvOnO4vcnlYMoxu2HlYX1lInbbEickU
         TDaYRH+LeeN0hFm0GOsJk4dakE7vka54vX6bm7oWgf1fYpEk50CQRprP1HV88emEgW6i
         iQgX4GfR/GmtJt02tjY/YSRoyWH4oW+iY1mQrzVRIn9ylEwgrSFGRRP/IoE7RyfYTotb
         Sq/820wijyUEbYV/yB4TgJdZ6TTPJALSoEvbk8twpuKknoSMPAufdeHRpezxrgFIQQz8
         WCaQ+6fC9OZw/f2BiUix6J8xEY/M8hztuR1wEFzqfMqwIIRsjRP5BUvrlfKI4MSS/kT6
         aqww==
X-Forwarded-Encrypted: i=1; AJvYcCX7bpO1MMvAgW0fUCTWACg94yjCeTvGdWHXRI8vZeAKnzj6vJPd+IUd0J72T2oOQS/6Z8vNY8h8+hrUw/M=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyLzhLBYytG8+4b3atWWCiUJlGbR96C1wDrL3AMhDX+WwCaAUCl
	7FAWOtufMqpl2B0ekjr10C/thyyl2D0fXzPCQHeNXgK/4XnRGCiqUxUN/w==
X-Google-Smtp-Source: AGHT+IHUD8wx+sxcJ3GTl+5YTHIAoc9Yh4cnphshWgvvC02107L7oyMgXpacGerBYUkuSjB90QmE9w==
X-Received: by 2002:a05:6808:1288:b0:3e0:3a72:e727 with SMTP id 5614622812f47-3e29b79e31emr4388513b6e.23.1727333877958;
        Wed, 25 Sep 2024 23:57:57 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c51112sm3656709a12.42.2024.09.25.23.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:57:57 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Subject: [PATCH 0/2] ARM: dts: aspeed: catalina: dts update for EVT and DVT
 schematic
Date: Thu, 26 Sep 2024 14:55:30 +0800
Message-Id: <20240926-catalina-evt-dvt-system-modify-v1-0-84a27b47040b@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGIF9WYC/x2NwQqDMBAFf0X23AWNjVR/pXhIzUu7UKNkgyjiv
 zf0MIe5zJykSAKloTopYROVJRZpbhVNHxffYPHFydTmXvem48ll95XoGFtmX9BDM2aeFy/h4Pb
 RvWBtg2B7KpE1Icj+HzzH6/oBNL+hXHAAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1727333875; l=577;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=V6n9edNBDvqt48afSqkdgg/mg3IbpQAEQ6jOWHmeCPw=;
 b=S11o17rt46kL05FyZieVQiv8RzWkn69jQE6bA24o4Pt6gKfL8Z4362cySgTxvRrFE/XasqTH9
 uwnH3c0QY3/BKLdq5OCKYBmlyqum5IcKIJ+OVIT/U5pzbTcbGQTqBan
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
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
Cc: devicetree@vger.kernel.org, linux-aspeed@lists.ozlabs.org, Potin Lai <potin.lai@quantatw.com>, linux-kernel@vger.kernel.org, Potin Lai <potin.lai.pt@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org
Sender: "Linux-aspeed" <linux-aspeed-bounces+lists+linux-aspeed=lfdr.de@lists.ozlabs.org>

Update Catalina devicetree based on EVT and DVT schematic changes.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
Potin Lai (2):
      ARM: dts: aspeed: catalina: move hdd board i2c mux bus to i2c5
      ARM: dts: aspeed: catalina: enable mac2

 .../dts/aspeed/aspeed-bmc-facebook-catalina.dts    | 172 +++++++++++----------
 1 file changed, 90 insertions(+), 82 deletions(-)
---
base-commit: e56a4f51601d8d874237557a359a3db0dc50b0a9
change-id: 20240926-catalina-evt-dvt-system-modify-386be551ef59

Best regards,
-- 
Potin Lai <potin.lai.pt@gmail.com>

